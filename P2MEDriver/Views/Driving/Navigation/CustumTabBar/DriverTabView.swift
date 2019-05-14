//
//  CustomDriverTabView.swift
//  P2MEDriver
//
//  Created by user on 16.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import UIKit

class DriverTabView: UIView {
   
    // MARK: - IBOutlets
    @IBOutlet weak var buttonStackView: UIStackView!
    @IBOutlet weak var viewWithInformation: DriverTubViewInfo!
    @IBOutlet weak var buttonWithInformation: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var tabViewHeightConstraint: NSLayoutConstraint!

    
    // MARK: - Properties
    var viewWithInformationOpenConstraint:CGFloat = 325
    var viewWithInformationCloseConstraint:CGFloat = 130
  
    var tabControllerIsOpen = false
    var viewWithCallAndMessageClose = false
    var tabControllerWithInformation = false 
    
    var tabBarDelegate: CustomTabBarDelegate?
    var confirmAndRefusalDelegate: PickUpAndRefusalDelegate?

    
    
    var modelInformation: ConfirmDriverModel?

    // MARK: -
    // MARK: - LC View
    override func draw(_ rect: CGRect) {
        configurateCornerRadius()
        configurateStartTabView(isOpen: tabControllerIsOpen, withInformation: tabControllerWithInformation)
    }
    
    
    // MARK: -
    // MARK: - Configurate Methods
    func configurateStartState() {
        tabControllerIsOpen = false
        viewWithCallAndMessageClose = false
        tabControllerWithInformation = false
        modelInformation = nil
        configurateStartTabView(isOpen: tabControllerIsOpen, withInformation: tabControllerWithInformation)
    }
    
    func configurateStartTabView(isOpen: Bool, withInformation: Bool) {
        self.viewWithInformation.alpha = isOpen ? 1 : 0
        tabViewHeightConstraint.constant = isOpen ? viewWithInformationOpenConstraint : viewWithInformationCloseConstraint
        tabControllerIsOpen = isOpen
        
        if withInformation == false {
            viewWithInformation(flag: true, spacing: 90, confirmButtonText: "CONFIRM")
        } else {
            viewWithInformation(flag: false, spacing: 50, confirmButtonText: "CONFIRM ORDER")
        }
        self.layoutIfNeeded()
    }
    
    private func viewWithInformation(flag: Bool, spacing: CGFloat, confirmButtonText: String) {
        buttonWithInformation.isHidden = flag
        buttonStackView.spacing = spacing
        confirmButton.setTitle(confirmButtonText, for: .normal)
        if flag == false {
            configurateViewWithInformation ()
        }
    }
    
    private func configurateCornerRadius() {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 15, height: 15))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    private func configurateViewWithInformation () {
        if let model = modelInformation {
            viewWithInformation.configurateView(model: model)
        } else {
            let model = ConfirmDriverModel()
            model.userPickUpModel?.deliveryUserAdress = "Suharevskaya 32/12"
            model.userPickUpModel?.payMethds = "Cash"
            model.userPickUpModel?.userNote = "Fast plz"
            model.userPickUpModel?.deliveryCost = "$110"
            model.userPickUpModel?.totalPrice = "$223"
            viewWithInformation.configurateView(model: model)
        }
    }
    
    // MARK: -
    // MARK: - Other methods
    func confirmOrderFromDriver() {
        configurateStartTabView(isOpen: tabControllerIsOpen, withInformation: false)
    }
    
    // MARK: -
    // MARK: - Action Methods
    @IBAction func stackViewButtons(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            print("Phone")
            tabBarDelegate?.viewWithCallAndMessageOpen(withMethods: .call)
        case 2:
            tabBarDelegate?.viewWithCallAndMessageOpen(withMethods: .message)
            print("Message")
        case 3:
            confirmAndRefusalDelegate?.refusalDelivery()
            print("Cancel")
        case 4:
            print("Information")
            if viewWithCallAndMessageClose == false {
                tabBarDelegate?.closeViewWithCallAndMessageForInfoOpen()
            }else{
                animationInformationView(isHidden: !tabControllerIsOpen)
            }
        default:
            break
        }
    }
    
    @IBAction func confirmButton(_ sender: UIButton) {
        if tabControllerWithInformation != true {
            confirmAndRefusalDelegate?.confirmOrder()
        } else {
            confirmAndRefusalDelegate?.confirmDelivery()
        }
    }
    
    // MARK: - Animation Methods
    func animationInformationView(isHidden: Bool) {
        let duration = isHidden ? 0 : 0.2
        UIView.animate(withDuration: duration, animations: {
            self.viewWithInformation.alpha = 0
        }) { (true) in
            UIView.animate(withDuration: 0.3, animations: {
                self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y - (isHidden ? 195 : -195), width: self.frame.width, height: isHidden ? self.viewWithInformationOpenConstraint : self.viewWithInformationCloseConstraint)
                self.tabViewHeightConstraint.constant = isHidden ? self.viewWithInformationOpenConstraint : self.viewWithInformationCloseConstraint
                self.layoutIfNeeded()
            }) { (true) in
                UIView.animate(withDuration: 0.2, animations: {
                    self.viewWithInformation.alpha = isHidden ? 1 : 0
                })
                self.tabControllerIsOpen = isHidden
            }
        }

    }
    
    
}
