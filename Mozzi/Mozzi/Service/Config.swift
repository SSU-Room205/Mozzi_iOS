import Foundation

enum Config {
    
    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
            static let apiKey = "API_KEY"
            static let clientId = "NMFClientId"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist cannot found.")
        }
        return dict
    }()
}

extension Config {
    
    static let baseURL: String = {
        guard let url = Config.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("Base URL is not set in plist for this configuration.")
        }
        return url
    }()
    
    static let apiKey: String = {
        guard let key = Config.infoDictionary[Keys.Plist.apiKey] as? String else {
            fatalError("Api Key is not set in plist for this configuration.")
        }
        return key
    }()
    
    static let clientID: String = {
        guard let clientID = Config.infoDictionary[Keys.Plist.clientId] as? String else {
            fatalError("Api Key is not set in plist for this configuration.")
        }
        return clientID
    }()
}
