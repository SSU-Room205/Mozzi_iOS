//
//  MapUnitCollectionViewCell.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/05/17.
//

import UIKit
import NMapsMap

class MapUnitCollectionViewCell: UICollectionViewCell, CollectionViewCellReuseProtocol {
    private let mapLabel: UILabel = {
        let label = UILabel()
        label.text = "지도"
        label.font = .pretendardBold(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private lazy var mapView: NMFMapView  = {
        let view = NMFMapView()
        view.makeCornerRound(radius: 10)
        return view
    }()
    
    var marker = NMFMarker()
    
    private lazy var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(mapLabel,mapView)
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setUI(){
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        self.addSubviews(stackView)
    }
    
    private func setConstraints() {
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        mapView.snp.makeConstraints{
            $0.width.equalTo(340)
            $0.height.equalTo(170)
        }
    }
    func moveToPosition(geocode: Geocode){
        let location = NMGLatLng(lat: geocode.latitude, lng: geocode.longitude)
        mapView.moveCamera(NMFCameraUpdate(scrollTo: location))
        mapView.zoomLevel = 17.0
        marker.position = location
        marker.mapView = mapView
    }
}
