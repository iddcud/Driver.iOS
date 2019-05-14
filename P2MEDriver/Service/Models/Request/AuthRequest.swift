//
//  AuthRequest.swift
//  P2MEDriver
//
//  Created by Q on 21/03/2019.
//  Copyright © 2019 DenisBaturitskiyDev. All rights reserved.
//

import Foundation

struct AuthRequest: Codable {
    let consumerEmail: String?
    
    enum CodingKeys: String, CodingKey {
        case consumerEmail = "consumer_email"
    }
}
