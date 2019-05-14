//
//  ConfirmRequest.swift
//  P2MEDriver
//
//  Created by Q on 24/03/2019.
//  Copyright © 2019 DenisBaturitskiyDev. All rights reserved.
//

import Foundation

struct ConfirmRequest: Codable {
    let tokenCode, consumerEmail: String?
    
    enum CodingKeys: String, CodingKey {
        case tokenCode = "token_code"
        case consumerEmail = "consumer_email"
    }
}
