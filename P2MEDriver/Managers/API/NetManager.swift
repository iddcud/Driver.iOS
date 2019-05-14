//
//  File1.swift
//  P2MEDriver
//
//  Created by user on 15.01.2019.
//  Copyright © 2019 DenisBaturitskiyDev. All rights reserved.
//

import Foundation
import Alamofire

enum NetworkEnvironment {
    case dev
    case staging
    case production
}

typealias NetworkCompletion<T: Decodable> = (_ result: RootObject<T>?, _ error: Error?) -> ()

class NetworkManager {
    
    // MARK: - Singleton
    static let shared = NetworkManager()
    private init() {}
    
    // MARK: - Static
    static let environment: NetworkEnvironment = .dev // if u in dev branch
    
    // MARK: - Private properties
    private let router = Rounter<DefaultAPI>()
    
    // MARK: - Public methods
    
    //    public func //METHODNAME(completionHandler: @escaping NetworkCompletion<//MODEL>) {
    //        router.request(.//REQ) { (response) in
    //            switch response.result {
    //            case .success(let data):
    //                completionHandler(Mapper.decode(data), nil)
    //            case .failure(let error):
    //                completionHandler(nil, error)
    //            }
    //        }
    //    }
    
}
