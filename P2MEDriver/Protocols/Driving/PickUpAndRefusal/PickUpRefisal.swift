//
//  as.swift
//  P2MEDriver
//
//  Created by user on 17.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import Foundation

protocol backRefusialIdDelegate {
    func backRefusialId()
}

protocol PickUpAndRefusalDelegate {
    func confirmAndStartDelivery()
    func confirmOrder()
    func confirmDelivery()
    func refusalDelivery()
    func refusalDeliveryCancelNavigationVC()
}
