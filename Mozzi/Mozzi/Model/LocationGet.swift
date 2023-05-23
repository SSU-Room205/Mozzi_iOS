//
//  LocationGet.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/05/22.
//

import Foundation

// MARK: - Location Get
struct LocationGet: Codable {
    let status: String
    let meta: Meta
    let addresses: [Address]
    let errorMessage: String
}

// MARK: - Address
struct Address: Codable {
    let roadAddress, jibunAddress, englishAddress: String?
    let addressElements: [AddressElement]?
    let x, y: String?
    let distance: Double?
}

// MARK: - AddressElement
struct AddressElement: Codable {
    let types: [String]
    let longName, shortName, code: String
}

// MARK: - Meta
struct Meta: Codable {
    let totalCount, page, count: Int
}
