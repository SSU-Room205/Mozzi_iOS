//
//  BaseScrollView.swift
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
    var color: UIColor{
        switch type {
        case .one: return .green
        case .two: return .blue
        case .three: return .cyan
        case .four: return .orange
        case .five: return .lightGray
        case .six: return .purple
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
