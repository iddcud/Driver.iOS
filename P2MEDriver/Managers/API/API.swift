//
//  File.swift
//  P2MEDriver
//
//  Created by user on 15.01.2019.
//  Copyright © 2019 DenisBaturitskiyDev. All rights reserved.
//

import Foundation
import Alamofire

struct Networking {
    enum ServerAPI: String {
        case devBaseURL        = "http://00.00.00.000:0000"
        case stagingBaseURL    = "http://00.00.00.000:0001"
        case productionBaseURL = "http://00.00.00.000:0002"
    }
}

enum DefaultAPI {
    case serverEndUrl
}

extension DefaultAPI: EndpointType {
    
    private var environmentBaseURL: String {
        switch NetworkManager.environment {
        case .dev:        return "\(Networking.ServerAPI.devBaseURL.rawValue)/api/v0/"
        case .staging:    return "\(Networking.ServerAPI.stagingBaseURL.rawValue)/api/v0/"
        case .production: return "\(Networking.ServerAPI.productionBaseURL.rawValue)/api/v0/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else {
            fatalError("BaseURL couldn't be configured")
        }
        return url
    }
    
    var path: String {
        switch self { default: return "/" }
    }
    
    var httpMethod: HTTPMethod {
        switch self { default: return .get }
    }
    
    var parameters: Parameters? {
        switch self { default: return nil }
    }
    
    var httpHeaders: HTTPHeaders? {
        switch self { default: return nil }
    }
    
}
