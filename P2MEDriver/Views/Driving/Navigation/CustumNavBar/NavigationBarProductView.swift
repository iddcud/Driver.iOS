//
//  NavigationBarProductView.swift
//  P2MEDriver
//
//  Created by user on 17.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import UIKit

class CustomNavigationBarProductView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var secondTitle: UILabel!
    
    @IBOutlet weak var heightNavViewConstraint: NSLayoutConstraint!
    
    // MARK: - Properties
    
    // MARK: - Flags
    var viewWithTwoLines = false
    
    
    // MARK: -
    // MARK: - View Life cycle
    override func draw(_ rect: CGRect) {
        configurateNavView()
        backgroundColor = UIColor.white
    }
    
    
    // MARK: -
    // MARK: - Configurate
    func configurateNavView() {
        if viewWithTwoLines == false {
            title.text = "Please specify the reason for refusal of delivery"
            title.textAlignment = .center
            secondTitle.isHidden = true
            heightNavViewConstraint.constant = 85
        }
    }
}
