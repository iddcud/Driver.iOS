//
//  ConfirmDriverModels.swift
//  P2MEDriver
//
//  Created by user on 16.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import Foundation
import UIKit

class ConfirmDriverModel: NSObject {
    var orderID: String?
    var minDriving: String?
    var category: String?
    var adress: String?
    var userPhoneNumber: String?
    var userFullName: String?
    var userImage: String?
    var pickUpPlaceName: String?
    var price: Double?
    
    var userPickUpModel: PickUpModel?
}

class ConfirmDriverModelCategory: NSObject {
    var categury: String?
    var categoryImage: UIImage?
    var categoryName: String?
    
    init(categuryID: String) {
        switch categuryID {
        case "Restaurants":
            categoryImage = #imageLiteral(resourceName: "ConfirmDriverRestourants.png")
        case "Shopping":
            categoryImage = #imageLiteral(resourceName: "ConfirmDriverShoping.png")
        case "Market":
            categoryImage = #imageLiteral(resourceName: "ConfirmDriverMarket.png")
        case "Courier delivery":
            categoryImage = #imageLiteral(resourceName: "ConfirmDriverCourier.png")
        case "Pharmacy":
            categoryImage = #imageLiteral(resourceName: "ConfirmDriverPharmacy.png")
        default:
            categoryImage = UIImage()
        }
    }
}
