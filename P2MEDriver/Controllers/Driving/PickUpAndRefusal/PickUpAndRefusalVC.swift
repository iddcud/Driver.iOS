//
//  PickUpAndRefusalVC.swift
//  P2MEDriver
//
//  Created by user on 17.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import UIKit

class PickUpAndRefusalVC: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var customNavBarView: CustomNavigationBarView!
    @IBOutlet weak var customNavBarProductView: CustomNavigationBarProductView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - Models
    var pickUpModels: PickUpModel?
    var reasonModels: [ReasonModel]?
    
    // MARK: - Properties
    var reasonId: Int?
    var navigationVcDelegate: PickUpAndRefusalDelegate?
    // MARK: - Flags
    var navigationBarTwoLines = true
    
    // MARK: -
    // MARK: - View Controller Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateCornerRadius()
        netManagerMethods()
        configurateNavigationBarView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func configurateCornerRadius() {
        let path = UIBezierPath(roundedRect: nextButton.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 15, height: 15))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        nextButton.layer.mask = mask
    }
    
    // MARK: -
    // MARK: - Configurate methods
    func configurateNavigationBarView() {
        customNavBarView.viewWithTwoLines = navigationBarTwoLines
        customNavBarProductView.viewWithTwoLines = navigationBarTwoLines
    }
    
    func netManagerMethods(){
        
        let reason1 = ReasonModel()
        reason1.reasonId = 1
        reason1.reasonName = "Reason"
        let reason2 = ReasonModel()
        reason2.reasonId = 2
        reason2.reasonName = "Reason"
        
        let reason3 = ReasonModel()
        reason3.reasonId = 3
        reason3.reasonName = "Reason"
        let reason4 = ReasonModel()
        reason4.reasonId = 4
        reason4.reasonName = "Reason"
        
        reasonModels = [reason1, reason2, reason3, reason4]
    }
    
    
    // MARK: -
    // MARK: - Others methods
    
    
    // MARK: -
    // MARK: - Action methods
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        if navigationBarTwoLines == false { // rename navigationbar to pick up of refuse
            if let id = reasonId {
                navigationVcDelegate?.refusalDeliveryCancelNavigationVC()
                dismiss(animated: true) {
                  print(id)  // reason id send to server
                }
            } else {
                // somthing call pick reason
            }
        } else {
            self.navigationVcDelegate?.confirmAndStartDelivery()
            dismiss(animated: true) {
                // send to server info about delivery start
            }
        }
    }
    
}
