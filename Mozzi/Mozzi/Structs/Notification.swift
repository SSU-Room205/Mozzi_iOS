//
//  NotificationImage.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/04/25.
//
struct Notification{
    
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
