//
//  PickUpAndRefusalModels.swift
//  P2MEDriver
//
//  Created by user on 16.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import Foundation

class PickUpItemModel : NSObject {
    var itemName: String?
    var quantity: String?
}

class PickUpModel : NSObject {
    var items: [PickUpItemModel]?
    var totalPrice: String?
    var deliveryCost: String?
    var deliveryUserName: String?
    var deliveryUserAdress: String?
    var payMethds: String?
    var userNote: String?
}

class ReasonModel : NSObject {
    var reasonName: String?
    var reasonId: Int?
}
