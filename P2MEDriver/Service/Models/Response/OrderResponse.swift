//
//  OrderResponse.swift
//  P2MEDriver
//
//  Created by Q on 21/03/2019.
//  Copyright © 2019 DenisBaturitskiyDev. All rights reserved.
//

import Foundation

struct OrderResponse: Codable {
    let id: Int?
    let consumer, address, created: String?
    let timeToDelivery: Date?
    let priceToDelivery: Int?
    let paid: Bool?
    let coupon: String?
    let status: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, consumer, address, created
        case timeToDelivery = "time_to_delivery"
        case priceToDelivery = "price_to_delivery"
        case paid, coupon, status
    }
}
