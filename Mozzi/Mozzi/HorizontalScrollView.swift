//
//  HorizontalScrollView.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/02/27.
//

import Foundation
import SnapKit


class BaseScrollView: UIScrollView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Not implemented xib init")
    }

    func configure() {}
    func bind() {}
}

struct SomeDataModel {
    enum DataModelType: String {
        case one
        case two
        case three
        case four
        case five
        case six
    }

    let type: DataModelType

    var name: String {
        return type.rawValue
    }

    var iamge: UIImage {
        switch type {
        case .one: return UIImage(named: "icon")!
        case .two: return UIImage(named: "icon")!
        case .three: return UIImage(named: "icon")!
        case .four: return UIImage(named: "icon")!
        case .five: return UIImage(named: "icon")!
        case .six: return UIImage(named: "icon")!
        }
    }

}

struct Mocks {
    static func getDataSource() -> [SomeDataModel] {
        return [SomeDataModel(type: .one),
                SomeDataModel(type: .two),
                SomeDataModel(type: .three),
                SomeDataModel(type: .four),
                SomeDataModel(type: .five),
                SomeDataModel(type: .six)]
    }
}


class HorizontalScrollView: BaseScrollView {
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 30.0
        return view
    }()
    
    var dataSource: [SomeDataModel]? {
         didSet { bind() }
     }
    
    override func configure() {
            super.configure()

            showsHorizontalScrollIndicator = false
            bounces = false

            addSubview(stackView)
            stackView.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview() /// 이 값이 없으면 scroll 안되는 것 주의
                make.height.equalToSuperview()
            }
        }
    override func bind() {
        super.bind()

        dataSource?.forEach { data in
            let button = UIButton()
            button.layer.cornerRadius = 30
            button.setTitleColor(.darkGray, for: .normal)
            button.setTitle(data.name, for: .normal)
           // button.setImage(data.iamge, for: .normal)
           // button.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: -4.0, bottom: 0.0, right: 2.0)
            button.backgroundColor = UIColor(named: "Dark Color")

            stackView.addArrangedSubview(button)
            button.snp.makeConstraints { make in
                make.width.equalTo(240)
                make.height.equalTo(80)
               // make.bottom.equalToSuperview().offset(-15)
                make.top.equalToSuperview().offset(15)
            }
        }
    }
}
