//
//  File2.swift
//  P2MEDriver
//
//  Created by user on 15.01.2019.
//  Copyright © 2019 DenisBaturitskiyDev. All rights reserved.
//
import Foundation
import Alamofire

typealias NetworkRouterCompletion = (_ response: DataResponse<Data>) -> ()

protocol NetworkRouter: AnyObject {
    associatedtype Endpoint: EndpointType
    func request(_ route: Endpoint, completionHandler: @escaping NetworkRouterCompletion)
    func cancel()
}
