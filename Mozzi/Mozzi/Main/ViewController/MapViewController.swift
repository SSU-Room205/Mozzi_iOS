//
//  MapViewController.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/03/13.
//

import UIKit
import CoreLocation
import SnapKit

class MapViewController: UITabBarController, MTMapViewDelegate {
    
    let subViewImage = UIImage(named: "back")
    private let dummy = Consum1.dummy()
    
    lazy var topAreaView = UIImageView()
    lazy var SearchView = UIImageView()
    lazy var SearchTextField = UITextField()
    lazy var SearchButton = UIButton()
    lazy var SocialButton = UIBarButtonItem()
    lazy var searchBar = UISearchBar()
    let placeListView = PlaceListView()
    var mapView: MTMapView!

    
    //
    //    let poilItem1 = MTMapPOIItem()
    //    let poilItem2 = MTMapPOIItem()
    
    var locationManager:CLLocationManager?
    var currentLocation:CLLocationCoordinate2D!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestAuthorization()
        configure()
    }
    
    private func configure(){
        mapView = MTMapView(frame: self.view.frame)
        mapView.delegate = self
        mapView.baseMapType = .standard
        self.view.addSubview(mapView)
        placeListView.placeTableView.dataSource = self
        placeListView.placeTableView.delegate = self
        
        searchBar.searchTextField.delegate = self
        // 현재 위치 트래킹
     //   mapView.currentLocationTrackingMode = .onWithoutHeading
        mapView.showCurrentLocationMarker = true
        
        // 지도의 센터를 설정 (x와 y 좌표, 줌 레벨 등을 설정)
        mapView.setMapCenter(MTMapPoint(geoCoord: MTMapPointGeo(latitude:  37.494705526855, longitude: 126.95994559383)), zoomLevel: 1, animated: true)
        
        let searchBarImage = UIImage(named: "searchBar")
        let areaImage = UIImage(named: "topArea")
        let socialImage = UIImage(named: "social")?.withRenderingMode(.alwaysOriginal)
        
        view.addSubview(topAreaView)
        
        
        topAreaView.image = areaImage
        topAreaView.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(-5)
            make.width.equalToSuperview()
        }
        
        SocialButton.image = socialImage
        self.navigationItem.rightBarButtonItem = SocialButton
        
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
        print("성공!✅✅✅✅✅✅✅")
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
    
    private func setPlaceListView() {
        print("modal init")
        let placeListViewController = PlaceListViewController()
        if let sheet = placeListViewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
        }
        present(placeListViewController, animated: true)
        print("modal init")
    }
    
}

extension MapViewController:CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            currentLocation = manager.location?.coordinate
            LocationService.shared.longitude = currentLocation.longitude
            LocationService.shared.latitude = currentLocation.latitude
        }
        
        //
        //        poilItem1.mapPoint = MTMapPoint(geoCoord: MTMapPointGeo(latitude: LocationService.shared.latitude , longitude: LocationService.shared.longitude))
        //        poilItem1.markerType = .redPin
        //
        //        mapView.addPOIItems([poilItem1])
    }
}

extension MapViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = placeListView.placeTableView.dequeueReusableCell(withIdentifier: PlaceListTableViewCell.identifier, for: indexPath) as? PlaceListTableViewCell
        else { return UITableViewCell() }
                
        cell.configureCell(dummy[indexPath.row])
        print(dummy[indexPath.row].itemName)
                
                return cell
    }
    
}



extension MapViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        self.view.endEditing(true)
    }
}
