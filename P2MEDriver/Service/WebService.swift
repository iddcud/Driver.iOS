//
//  WebService.swift
//  P2MEDriver
//
//  Created by Q on 21/03/2019.
//  Copyright © 2019 DenisBaturitskiyDev. All rights reserved.
//

import Foundation
import Alamofire

class WebService: NSObject {
    
    func POSTQuery(endpoint: String, params: [String: Any]? = nil, success: @escaping (_ responseObject: Any?) -> Void ,failure: @escaping (_ error: String?) -> Void ) {
        
        var headers: HTTPHeaders = [:]
        
        if (UserDefaults.standard.object(forKey: "token") != nil) {
            headers = ["Authorization" : "Token \(UserDefaults.standard.object(forKey: "token")!)",
                "Content-Type":"application/json; charset=utf-8"]
        }
        
        Alamofire.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers)
            .validate(statusCode: 200..<600)
            .responseData { response in
                
                switch response.result
                {
                case .failure(let error):
                    if let data = response.data {
                        print("Print Server Error: " + String(data: data, encoding: String.Encoding.utf8)!)
                    }
                    print(error)
                    
                case .success(let responseData):
                    success(responseData)
                }
        }
    }
    
    
    func GETQuery(endpoint: String, params: [String: Any]? = nil, success: @escaping (_ responseObject: Any?) -> Void ,failure: @escaping (_ error:
        String?) -> Void ) {
        
        var headers: HTTPHeaders = [:]
        
        if (UserDefaults.standard.object(forKey: "token") != nil) {
            headers = ["Authorization" : "Token \(UserDefaults.standard.object(forKey: "token")!)"]
        }
        
        Alamofire.request(endpoint, method: .get, parameters: params, encoding: JSONEncoding.default, headers: headers)
            .validate(statusCode: 200..<600)
            .responseData { response in
                
                switch response.result
                {
                case .failure(let error):
                    if let data = response.data {
                        print("Print Server Error: " + String(data: data, encoding: String.Encoding.utf8)!)
                    }
                    print(error)
                    
                case .success(let responseData):
                    success(responseData)
                }
        }
    }
}

extension Encodable {
    func toDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}
