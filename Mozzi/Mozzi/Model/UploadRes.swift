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
    let date: String
    let item: [String]
    let address, price, memo, storeName: String
    let itemPrice: [String]
    let category: String
    let point: Int
}

struct Post: Codable {
    
}
