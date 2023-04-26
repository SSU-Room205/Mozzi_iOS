//
//  String+.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/04/26.
//

import UIKit

extension String {
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        if let date = dateFormatter.date(from: self){
            return date
        } else {
            return nil
        }
    }
}
