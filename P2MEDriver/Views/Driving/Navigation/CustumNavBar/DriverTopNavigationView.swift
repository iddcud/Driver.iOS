//
//  DriverTopNavigationView.swift
//  P2MEDriver
//
//  Created by user on 17.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import UIKit

class CustomDriverTopNavigationView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var navigationAdress: UILabel!
    @IBOutlet weak var toName: UILabel!
    
    // MARK: - Properties
    var userModel: ConfirmDriverModel?
    
    
    // MARK: -
    // MARK: - LC View
    override func draw(_ rect: CGRect) {
        configureWithModel()
        
    }
    
    // MARK: -
    // MARK: - Configurate
    
    
    
    func configureWithModel() {
        if let user = userModel {
            if let navigationAdressText = user.adress { navigationAdress.text = navigationAdressText }
            if let toNameText = user.pickUpPlaceName { toName.text = toNameText }
        } else {
            navigationAdress.text = "Lva Tolstogo street 23"
            toName.text = "Mac Donalds"
        }
    }
    
    func confiturateWithDelivery() {
        if let user = userModel {
            if let navigationAdressText = user.userPickUpModel?.deliveryUserAdress { navigationAdress.text = navigationAdressText }
            if let toNameText = user.userFullName { toName.text = toNameText }
        }
    }
    
    
}
