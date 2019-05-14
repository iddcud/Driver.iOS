//
//  OrderListResponse.swift
//  P2MEDriver
//
//  Created by Q on 21/03/2019.
//  Copyright © 2019 DenisBaturitskiyDev. All rights reserved.
//

import Foundation

typealias OrderListResponse = [OrderListData]

struct OrderListData: Codable {
    let id: Int?
    let address, created: String?
    let timeToDelivery: String?
    let priceToDelivery: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, address, created
        case timeToDelivery = "time_to_delivery"
        case priceToDelivery = "price_to_delivery"
    }
}
