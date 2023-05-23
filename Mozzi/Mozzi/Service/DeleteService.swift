import Foundation
import Alamofire

class DeleteService {
    static let shared = DeleteService()
    func deleteService <T: Decodable> (from url: String,
                                     isTokenUse: Bool,
                                     callback: @escaping (_ data: T?, _ error: String?) -> ()) {
        let header: HTTPHeaders = ["Content-Type": "application/json"]
                                   AF.request(url,
                                              method: .delete,
                                     encoding: JSONEncoding.default,
                                     headers: header).response { response in
                                       dump(response)

            do {
                guard let resData = response.data else {
                    callback(nil, "emptyData")
                    return
                }
                let data = try JSONDecoder().decode(T.self, from: resData)
                callback(data, nil)
            } catch {
                callback(nil, error.localizedDescription)
            }
        }
    }
    
}
