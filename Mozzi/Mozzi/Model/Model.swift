//
//  Model.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/03/27.
//

import Foundation
import UIKit

let darkColor = UIColor(named: "Dark Color")
let mainColor = UIColor(named: "main Color")
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

struct notificationData{
    
    enum NotificationType {
        case normal
        case review
        case increase
        case decrease
    }
    
    let notiType: NotificationType
    
    var image: UIImage{
        switch notiType{
        case .increase: return UIImage(named: "increase")!
        case .decrease: return UIImage(named: "decrease")!
        case .review: return UIImage(named: "review")!
        default: return UIImage(named: "normal")!
        }
    
    }
    
}
