//
//  CustomNavigationBarView.swift
//  P2MEDriver
//
//  Created by user on 17.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import UIKit

class CustomNavigationBarView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var secondTitle: UILabel!
    
    @IBOutlet weak var heightNavBarConstraint: NSLayoutConstraint!
    
    // MARK: - Properties
    
    // MARK: - Flags
    var viewWithTwoLines = false
    
    // MARK: - View Life cycle
    override func draw(_ rect: CGRect) {
        configurateNavBar()
    }
    
    func configurateNavBar() {
        if viewWithTwoLines == false {
            secondTitle.isHidden = true
            heightNavBarConstraint.constant = 75
        }
    }
    
    
    
}
