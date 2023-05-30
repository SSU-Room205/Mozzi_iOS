//
//  MapViewController.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/03/13.
//

import UIKit
import CoreLocation
import SnapKit
import NMapsMap
import Alamofire
import SwiftyJSON

protocol MapDataDelegate: AnyObject {
    func didReceiveData(dataList: DataResponse)
}

class MapViewController: UITabBarController, NMFMapViewTouchDelegate {
    
    var dataList: DataResponse = [] {
        didSet {
            placeListView.placeTableView.reloadData()
        }
    }
    
    var addressList: [String] = [] {
        didSet {
            placeListView.placeTableView.reloadData()
        }
    }
    
    var geocodeList: [Geocode] = [] {
        didSet {
            placeListView.placeTableView.reloadData()
        }
    }
    
    var socialList1: DataResponse = [] {
        didSet{
            placeListView.placeTableView.reloadData()
        }
    }
    
    
    var socialMarkers: [NMFMarker] = []
    
    var socialAddressList: [String] = []
    
    let baseURL = Config.baseURL
    
    let subViewImage = UIImage(named: "back")
    let searchBarImage = UIImage(named: "searchBar")
    let areaImage = UIImage(named: "topArea")
    let socialImage = UIImage(named: "social")?.withRenderingMode(.alwaysOriginal)
    
    weak var dataDelegate: MapDataDelegate?
    
    lazy var topAreaView = UIImageView()
    lazy var SearchView = UIImageView()
    lazy var SearchTextField = UITextField()
    lazy var SearchButton = UIButton()
    lazy var socialButton: UIButton = {
       let button = UIButton()
        button.setImage(Images.iconPrivate, for: .normal)
        button.addTarget(self, action: #selector(socialButtonDidTap), for: .touchUpInside)
        button.setImage(Images.iconPrivate, for: .selected)
        return button
    }()
    lazy var searchBar = UISearchBar()
    lazy var placeListView = PlaceListView()
    let naverMaps = NMFNaverMapView()
    private let markerLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    
    var locationManager:CLLocationManager?
    var currentLocation:CLLocationCoordinate2D!
    
    var selectedMarker: NMFMarker?
    var markers: [NMFMarker?] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestAuthorization()
        configure()
        getData(dataString: "data2")
    }
    
    private func configure(){
        
        self.view.addSubview(naverMaps)
        naverMaps.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        placeListView.placeTableView.dataSource = self
        placeListView.placeTableView.delegate = self
        
        searchBar.searchTextField.delegate = self
        
        
        view.addSubview(topAreaView)
        navigationItem.backButtonTitle = ""
        
        topAreaView.image = areaImage
        topAreaView.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(-5)
            make.width.equalToSuperview()
        }
        
        let barButton = UIBarButtonItem(customView: socialButton)
        self.navigationItem.rightBarButtonItem = barButton
        
        
        searchBar.placeholder = "검색어를 입력해주세요."
        searchBar.backgroundImage = searchBarImage
        self.navigationItem.titleView = searchBar
        
        topAreaView.addSubview(SearchView)
        
        view.addSubview(placeListView)
        
        
        placeListView.snp.makeConstraints{
            $0.bottom.width.equalToSuperview()
            $0.height.equalTo(view.frame.height - 150)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    private func requestAuthorization() {
        if locationManager == nil {
            locationManager = CLLocationManager()
            //정확도를 검사한다.
            locationManager!.desiredAccuracy = kCLLocationAccuracyBest
            //앱을 사용할때 권한요청
            locationManager!.requestWhenInUseAuthorization()
            locationManager!.delegate = self
            locationManagerDidChangeAuthorization(locationManager!)
        }else{
            //사용자의 위치가 바뀌고 있는지 확인하는 메소드
            locationManager!.startMonitoringSignificantLocationChanges()
        }
    }
    
    private func getData(dataString: String) {
        GetService.shared.getService(from: baseURL+dataString,
                                     isTokenUse: false) {
            (data: DataResponse?, error) in
            guard let data = data else {
                print("error: \(String(describing: error?.debugDescription))")
                return
            }
            self.dataList = data
            if !(self.addressList.isEmpty) {
                self.addressList.removeAll()
            }
            data.forEach { dataElement in
                self.addressList.append(dataElement.address)
            }
            
            let dispatchGroup = DispatchGroup()
            
            for i in 0..<self.addressList.count {
                dispatchGroup.enter()
                self.reverseGeocode(address: self.addressList[i]) { geocode in
                    DispatchQueue.main.async {
                        let marker = NMFMarker(position: NMGLatLng(lat: geocode.latitude, lng: geocode.longitude))
                        self.markers.append(marker)
                        marker.mapView = self.naverMaps.mapView
                        marker.captionText = self.dataList[i].storeName
                        marker.captionTextSize = 0
                        marker.width = 40
                        marker.height = 50
                        self.touchMarker()
                        dispatchGroup.leave()
                    }
                }
            }
            
            dispatchGroup.notify(queue: .main) {
                // 모든 마커가 추가된 후에 수행할 작업
                // 예: 필요한 UI 업데이트 등
                print("모든 마커가 추가되었습니다.")
            }
            self.dataDelegate?.didReceiveData(dataList: data)
        }
        
    }
    //MARK: -Action
    @objc func socialButtonDidTap(){
        //소셜 버튼 On/Off
        socialButton.isSelected = !(socialButton.isSelected)
        
        if socialButton.isSelected {
            //버튼이 select일 때
            
        } else {
            //버튼이 해제됐을 때
            
        }
        
    }
}

extension MapViewController:CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            currentLocation = manager.location?.coordinate
            LocationService.shared.longitude = currentLocation.longitude
            LocationService.shared.latitude = currentLocation.latitude
            let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: manager.location?.coordinate.latitude ?? 0, lng: manager.location?.coordinate.longitude ?? 0))
            cameraUpdate.animation = .easeIn
            naverMaps.mapView.moveCamera(cameraUpdate)
            naverMaps.mapView.positionMode = .normal
            
        }
    }
    
    func reverseGeocode(address: String,  completionHandler: @escaping (Geocode) -> Void) {
        let clientID = Config.clientID
        let clientApiKey = Config.apiKey
        let baseURL = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query="
        
        let location = address
        let encodeAddress = location.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        let header1 = HTTPHeader(name: "X-NCP-APIGW-API-KEY-ID", value: clientID)
        let header2 = HTTPHeader(name: "X-NCP-APIGW-API-KEY", value: clientApiKey)
        let headers = HTTPHeaders([header1,header2])
        
        var geocode: Geocode = Geocode(longitude: 0, latitude: 0)
        
        AF.request(baseURL+encodeAddress, method: .get, headers: headers).validate()
            .responseDecodable(of: LocationGet.self) { response in
                switch response.result {
                case .success(let value):
                    guard let lat = Double(value.addresses[0].y!) else { return }
                    guard let lon = Double(value.addresses[0].x!) else { return }
                    geocode = Geocode(longitude: lon, latitude: lat)
                    completionHandler(geocode)
                    self.geocodeList.append(geocode)
                case .failure(let error):
                    print(error.errorDescription ?? "")
                    
                default:
                    fatalError()
                }
            }
    }
}

extension MapViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell selected")
        let nextViewController = DetailViewController()
        nextViewController.data = dataList[indexPath.row]
        
        // reverseGeocode 함수를 호출하여 geocode 값을 가져온 후, nextViewController에 할당
        reverseGeocode(address: dataList[indexPath.row].address) { geocode in
            DispatchQueue.main.async {
                nextViewController.geocode = geocode
                
                // 이미지 전달
                if let cell = tableView.cellForRow(at: indexPath) as? PlaceListTableViewCell {
                    nextViewController.image = cell.placeImageView.image
                }
                
                self.navigationController?.pushViewController(nextViewController, animated: true)
            }
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 셀의 높이를 계산하는 로직을 구현합니다.
        return calculateCellHeight(for: indexPath)
    }
    
    private func calculateCellHeight(for indexPath: IndexPath) -> CGFloat {
        let cell = PlaceListTableViewCell(style: .subtitle, reuseIdentifier: PlaceListTableViewCell.identifier) // 새로운 셀 인스턴스 생성
        
        cell.configureCellData(dataList[indexPath.row])
        
        // 셀의 높이를 계산합니다.
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        let stackViewHeight = cell.infomationStackView.frame.height
        let verticalPadding: CGFloat = 30 // 예시로 추가한 상하 여백
        let cellHeight = stackViewHeight + verticalPadding
        
        return max(cellHeight,130)
    }
    
    func touchMarker(){
        for marker in markers {
            marker?.touchHandler = { (overlay) -> Bool in
                print("마커 터치 이벤트 발생")
                if let marker = overlay as? NMFMarker {
                    // 이전에 선택된 마커가 있다면 크기를 원래대로 되돌림
                    self.selectedMarker?.width = 40
                    self.selectedMarker?.height = 50
                    self.selectedMarker?.captionTextSize = 0
                    
                    // 현재 선택된 마커의 크기를 변경
                    marker.width = 60
                    marker.height = 300/4
                    marker.captionTextSize = 13
                    marker.captionColor = .blue
                    // 라벨을 표시하기 위해 마커의 좌표와 라벨의 위치를 맞춤
                    //                let label = marker.iconView as? UILabel
                    //                markerLabel?.frame.origin.y = -70
                    
                    // 선택된 마커를 저장
                    self.selectedMarker = marker
                }
                
                return true
                
            }
        }
    }
}

extension MapViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count + socialList1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = placeListView.placeTableView.dequeueReusableCell(withIdentifier: PlaceListTableViewCell.identifier, for: indexPath) as? PlaceListTableViewCell
        else { return UITableViewCell() }
        
        cell.configureCellData(dataList[indexPath.row])
        
        return cell
    }
}



extension MapViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        self.view.endEditing(true)
    }
}

extension MapViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        getData(dataString: "data2")
       placeListView.placeTableView.reloadData()
    }
}

