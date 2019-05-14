//
//  Presenters.swift
//  P2MEDriver
//
//  Created by user on 16.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import UIKit
import Foundation

class Presenters: NSObject {
    
    
    func presentConfirmDriverVC(model: ConfirmDriverModel, viewController: NavigationVC) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ConfirmDriverVC") as! ConfirmDriverVC
        vc.modalPresentationStyle = .overFullScreen
        vc.confirmModel = model
        vc.confirmOrderDelegate = viewController
        viewController.present(vc, animated: true, completion: nil)
    }

    func presentConfirmOrder(model: ConfirmDriverModel, viewController: NavigationVC) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PickUpAndRefusalVC") as! PickUpAndRefusalVC
        vc.modalPresentationStyle = .overFullScreen
        vc.navigationVcDelegate = viewController
        vc.pickUpModels = model.userPickUpModel
        viewController.present(vc, animated: true, completion: nil)
    }
    
    func presentRefusalVC(viewController: NavigationVC) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PickUpAndRefusalVC") as! PickUpAndRefusalVC
        vc.modalPresentationStyle = .overFullScreen
        vc.navigationBarTwoLines = false
        vc.navigationVcDelegate = viewController
        viewController.present(vc, animated: true, completion: nil)
    }

    func presentConfirmDelivery(viewController: NavigationVC){
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CustomNavC") as! CustomNavC
        vc.modalPresentationStyle = .overFullScreen
        vc.otpDelegate = viewController
        viewController.present(vc, animated: true, completion: nil)
    }
    
}
