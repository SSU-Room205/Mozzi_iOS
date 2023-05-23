//
//  GetGeocode.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/05/21.
//

import Foundation
import Alamofire

final class GeoService {
    
    static let shared = GeoService()
    
    private init() {}
    
    func getGeocode(location: String,
                    completion: @escaping (NetworkResult<Any>) -> Void) {
        let geocoderURL = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query="
        let clientID = Config.clientID
        let clientSecret = Config.apiKey
        
        let header1 = HTTPHeader(name: "X-NCP-APIGW-API-KEY-ID", value: clientID)
        let header2 = HTTPHeader(name: "X-NCP-APIGW-API-KEY", value: clientSecret)
        let headers = HTTPHeaders([header1,header2])
        
        let dataRequest = AF.request(geocoderURL+location,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: headers)
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isValidData(data: data)
        case 400, 409: return isValidData(data: data)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(LocationGet.self, from: data) else { return .pathErr }
        
        return .success(decodedData as Any)
    }
}

