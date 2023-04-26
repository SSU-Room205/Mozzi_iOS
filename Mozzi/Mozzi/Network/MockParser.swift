//
//  MockParser.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/04/27.
//
import Foundation

final class MockParser {
    static func load<D: Codable>(_ type: D.Type, from resourceName: String) -> D? {
    // type : 디코딩 할 때 사용되는 모델의 타입
    // resourceName : json 파일의 이름
        guard let path = Bundle.main.path(forResource: resourceName, ofType: "json") else {
            return nil
        }
        // 확장자가 json인 파일의 경로를 가져오는 부분
        guard let jsonString = try? String(contentsOfFile: path) else {
            return nil
        }
         // 파일 안에 있는 데이터(json)을 String 형태로 가져온다
        print(jsonString)
        
        let decoder = JSONDecoder()
        let data = jsonString.data(using: .utf8)
        // string 형태로 가져온 json을 data형으로 변환
        print(data)
        
        guard let data = data else { return nil }
        return try? decoder.decode(type, from: data)
        // data를 swift 형태로 사용하기 위해 decoding하는 과정
    }
}
