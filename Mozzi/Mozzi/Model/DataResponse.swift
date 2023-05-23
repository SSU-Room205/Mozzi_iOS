//
//  DataRequest.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/05/22.
//

import Foundation

// MARK: - DataResponseElement
struct DataResponseElement: Codable {
    let date: String
    let item: [String]
    let address: String
    let price: Int
    let memo, storeName: String
    let itemPrice: [Int]
    let category: String
    let point: Int
}

enum ItemPrice: Codable {
    case integer(Int)
    case string(String)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(ItemPrice.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ItemPrice"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

typealias DataResponse = [DataResponseElement]
