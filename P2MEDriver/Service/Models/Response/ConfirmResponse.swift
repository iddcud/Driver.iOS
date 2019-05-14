//
//  ConfirmResponse.swift
//  P2MEDriver
//
//  Created by Q on 24/03/2019.
//  Copyright © 2019 DenisBaturitskiyDev. All rights reserved.
//

import Foundation

struct ConfirmResponse: Codable {
    let data: TokeData?
}

struct TokeData: Codable {
    let token: String?
}
