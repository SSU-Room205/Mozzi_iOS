//
//  DataRequest.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/05/22.
//

import Foundation
// MARK: - DataResponseElement
struct DataResponseElement: Codable {
    let date, address, memo, storeName: String
    let category: String
    let point: Int
    let item, itemPrice: [String]
    let price: String
    let imagePath: String?
}

typealias DataResponse = [DataResponseElement]
