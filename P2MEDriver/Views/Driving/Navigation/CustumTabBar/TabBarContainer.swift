//
//  TabBarContainer.swift
//  P2MEDriver
//
//  Created by user on 16.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import UIKit

class TabBarContainer: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var driverTabView: DriverTabView!
    @IBOutlet weak var callAndMessageView: CallAndMessageView!

    // MARK: -
    // MARK: - LC View
    override func draw(_ rect: CGRect) {
        driverTabView.tabBarDelegate = self
        callAndMessageView.tabBarInfo = self
    }
    
    // MARK: -
    // MARK: - Configurate Methods
    
    func configurateStarState() {
        callAndMessageView.configurateStartState()
        driverTabView.configurateStartState()
    }
    
    func configurateModel(model: ConfirmDriverModel) {
        callAndMessageView.userModel = model
        driverTabView.modelInformation = model
    }
    
    // MARK:
    // MARK: - Other methods
    func confirmAndStartDelivery() {
        driverTabView.tabControllerWithInformation = true
        driverTabView.configurateStartTabView(isOpen: driverTabView.tabControllerIsOpen, withInformation: true)
    }

}
extension TabBarContainer: CustomTabInfoDelegate {
    func closeViewWithCallAndMessageAndOpenInfo() {
        driverTabView.animationInformationView(isHidden: !driverTabView.tabControllerIsOpen)
    }    
}

extension TabBarContainer: CustomTabBarDelegate {
    func closeViewWithCallAndMessageForInfoOpen() {
        callAndMessageView.closeView()
        driverTabView.viewWithCallAndMessageClose = true
    }
    
    func viewWithCallAndMessageOpen(withMethods: CallAndMessageViewOpenWith) {
        if let methods = callAndMessageView.openWithMethods {
        if (methods != withMethods) && (callAndMessageView.viewIsHiden == false) {
            callAndMessageView.closeAndOpenAnimation(callAndMessageView.viewIsHiden, withMethods: withMethods)
        } else {
            callAndMessageView.viewWithInformation(callAndMessageView.viewIsHiden, withMethods: withMethods)
        }
        } else {
            callAndMessageView.viewWithInformation(callAndMessageView.viewIsHiden, withMethods: withMethods)
        }
        driverTabView.viewWithCallAndMessageClose = callAndMessageView.viewIsHiden
    }
}
