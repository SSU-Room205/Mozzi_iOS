import Foundation
import Alamofire

class PostService {
    static let shared = PostService()
    func postService <T: Decodable> (with param: Parameters,
                                     from url: String,
                                     isTokenUse: Bool,
                                     callback: @escaping (_ data: T?, _ error: String?) -> ()) {
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        AF.request(url,
                   method: .post,
                   parameters: param,
                   encoding: JSONEncoding.default,
                   headers: header).response { response in
            do {
                guard let resData = response.data else {
                    callback(nil, "emptyData")
                    return
                }
                let data = try JSONDecoder().decode(T.self, from: resData)
                dump(response)
                callback(data, nil)
            } catch {
                callback(nil, error.localizedDescription)
            }
        }
    }

}
