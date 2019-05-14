//
//  File.swift
//  P2MEDriver
//
//  Created by user on 15.01.2019.
//  Copyright © 2019 DenisBaturitskiyDev. All rights reserved.
//
import Alamofire
import Foundation

protocol EndpointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var parameters: Parameters? { get }
    var httpHeaders: HTTPHeaders? { get }
}
