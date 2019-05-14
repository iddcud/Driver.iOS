//
//  DriverTubViewInfo.swift
//  P2MEDriver
//
//  Created by user on 16.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import UIKit

class DriverTubViewInfo: UIView {
    @IBOutlet weak var adressPickUpLabel: UILabel!
    @IBOutlet weak var paymentsMethodsLabel: UILabel!
    @IBOutlet weak var noteFromUserLabel: UILabel!
    @IBOutlet weak var costDeliveryLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
        
    @IBOutlet weak var costDeliveryTextLabel: UILabel!
    @IBOutlet weak var totalPriceTextLabel: UILabel!
        
    func configurateView(model: ConfirmDriverModel) {
        adressPickUpLabel.text = model.userPickUpModel?.deliveryUserAdress
        paymentsMethodsLabel.text = model.userPickUpModel?.payMethds
        noteFromUserLabel.text = model.userPickUpModel?.userNote
        costDeliveryLabel.text = model.userPickUpModel?.deliveryCost
        totalPriceLabel.text = model.userPickUpModel?.totalPrice
    }
        
    private func configurateTextLabels() {
        // if it need
    }
    
}
    

