//
//  ErningModels.swift
//  P2MEDriver
//
//  Created by user on 24.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import Foundation

class ErningModel: Decodable {
    var tripsCount: String
    var onlineTime: String
    var driverTrips: [DriverTrips]
    var driverErning: [DriverErning]
    
    init(tripsCount:String, onlineTime:String, driverTrips: [DriverTrips], driverErning: [DriverErning]) {
        self.tripsCount = tripsCount
        self.onlineTime = onlineTime
        self.driverTrips = driverTrips
        self.driverErning = driverErning
    }
}

class DriverTrips: Decodable {
    var time: String
    var deliveryMethod: String
    var deliveryPrice: String
    var deliveryFrom: String
    var deliveryTo: String
    var deliveryClientName: String
    
    init(time:String, deliveryMethod:String, deliveryPrice: String,deliveryFrom:String, deliveryTo:String, deliveryClientName: String) {
        self.time = time
        self.deliveryMethod = deliveryMethod
        self.deliveryPrice = deliveryPrice
        self.deliveryFrom = deliveryFrom
        self.deliveryTo = deliveryTo
        self.deliveryClientName = deliveryClientName
    }
}

class DriverErning: Decodable {
    var erningDriver: String
    var erningMethods: String
   
    init(erningDriver:String, erningMethods:String) {
        self.erningDriver = erningDriver
        self.erningMethods = erningMethods
    }
}
