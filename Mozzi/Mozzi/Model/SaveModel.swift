//
//  StoreModel.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/05/27.
//

import Foundation

struct SaveModel: Codable {
    let date, address, memo, storeName,firstName: String
    let category: String
    let point: Int
    let item, itemPrice: [String]
    let price: String
}
