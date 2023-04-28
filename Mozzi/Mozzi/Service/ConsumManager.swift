//
//  ConsumManager.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/04/27.
//

import Foundation

final class ConsumManager {
    // service code
    static let shared = ConsumManager()
    private init() {}
}

extension ConsumManager {
    func getTodoMock() -> [Consum] {
        return MockParser.load([Consum].self, from: "Consum")!
    }
}
 
