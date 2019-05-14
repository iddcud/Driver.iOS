//
//  SocketModel.swift
//  P2MEDriver
//
//  Created by Q on 23/03/2019.
//  Copyright © 2019 DenisBaturitskiyDev. All rights reserved.
//

import Foundation

struct SocketModel: Codable {
    let type, orderID: String?
    let deliveryCost: Double?
    let supplierCategory, supplierAddress, supplierPhone: String?
    
    enum CodingKeys: String, CodingKey {
        case type
        case orderID = "order_id"
        case deliveryCost = "delivery_cost"
        case supplierCategory = "supplier_category"
        case supplierAddress = "supplier_address"
        case supplierPhone = "supplier_phone"
    }
}
