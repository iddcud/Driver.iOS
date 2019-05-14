//
//  File1.swift
//  P2MEDriver
//
//  Created by user on 15.01.2019.
//  Copyright © 2019 DenisBaturitskiyDev. All rights reserved.
//

import Foundation
import Alamofire

class Rounter<Endpoint: EndpointType>: NetworkRouter {
    
    // MARK: - Properties
    var request: DataRequest?
    
    // MARK: - Methods
    func request(_ route: Endpoint, completionHandler: @escaping NetworkRouterCompletion) {
//        request = Af.request(route.baseURL.appendingPathComponent(route.path),
//                             method: route.httpMethod,
//                             parameters: route.parameters,
//                             encoding: JSONEncoding.default,
//                             headers: route.httpHeaders).responseData(completionHandler: { (response) in
//                                completionHandler(response)
//                             })
    }
    
    func cancel() {
        request?.cancel()
    }
    
}
