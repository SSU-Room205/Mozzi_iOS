//
//  UploadResponse.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/04/19.
//

import Foundation

struct UploadRes: Decodable {
    let name: String
    let price: String
    let date: String
    let address: String
    var itemName: Array<String>
    var itemCount: Array<String>
    var itemPrice: Array<String>
}


// MARK: - AddRequest
struct AddRequest: Codable {
    let storeName, address: String
    let price: Int
    let item, itemPrice, date, category: String
    let point: Int
    let memo: String
}

