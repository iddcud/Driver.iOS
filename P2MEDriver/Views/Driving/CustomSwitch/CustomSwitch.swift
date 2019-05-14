//
//  CustomSwitch.swift
//  P2MEDriver
//
//  Created by Q on 22/03/2019.
//  Copyright © 2019 DenisBaturitskiyDev. All rights reserved.
//

import UIKit

protocol CustomSwitchDelegate : class {
    func thumbDidTouch(_ sender: UIButton)
}

class CustomSwitch: UIView {
    
    var backgroundImage = UIImageView()
    var thumbButton = UIButton()
    var thumbButtonView = UIView()
    var statusLabel = UILabel()
    var thumbPosX: CGFloat = 0.0
    var statusLabelCenterX: CGFloat = -12.0
    
    weak var delegate: CustomSwitchDelegate?
    
    override func draw(_ rect: CGRect) {
    
    }
    
    func initSwitchView() {
        frame = CGRect(x: 12.0, y: 24.0, width: 108.0, height: 32.0)
        backgroundColor = .clear
        
        backgroundImage.frame = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
        backgroundImage.image = UIImage.init(named: "ic_switch_offline")
        addSubview(backgroundImage)
        
        thumbButtonView.frame = CGRect(x: 0.0, y: 0.0, width: 32.0, height: 32.0)
        thumbButtonView.backgroundColor = .white
        thumbButtonView.layer.cornerRadius = 16.0
        thumbButtonView.layer.borderWidth = 1
        thumbButtonView.layer.borderColor = UIColor.darkGray.cgColor
        addSubview(thumbButtonView)
        
        statusLabel.frame = CGRect(x: 0.0, y: 0.0, width: 66.0, height: 18.0)
        statusLabel.center.x = center.x + 6.0
        statusLabel.center.y = 16.0
        statusLabel.font = UIFont.systemFont(ofSize: 15.0, weight: .semibold)
        statusLabel.textAlignment = .center
        statusLabel.textColor = .white
        statusLabel.text = "OFF LINE"
        addSubview(statusLabel)
        
        thumbButton.frame = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
        thumbButton.backgroundColor = .clear
        thumbButton.titleLabel?.text = ""
        thumbButton.addTarget(self, action: #selector(thumbButtonAction), for: .touchUpInside)
        addSubview(thumbButton)
    }
    
    @objc func thumbButtonAction() {
        if thumbButton.isSelected {
            UIView.animate(withDuration: 0.2, animations: {
                self.thumbButtonView.center.x = 16.0
                self.statusLabel.center.x = (self.frame.width - self.thumbButtonView.frame.width)/2 + self.thumbButtonView.frame.width
            })
            statusLabel.text = "OFF LINE"
            backgroundImage.image = UIImage.init(named: "ic_switch_offline")
            thumbButton.isSelected = false
        } else {
            UIView.animate(withDuration: 0.2, animations: {
                self.thumbButtonView.center.x = self.frame.width - 16.0
                self.statusLabel.center.x = (self.frame.width - self.thumbButtonView.frame.width)/2
            })
            statusLabel.text = "ON LINE"
            backgroundImage.image = UIImage.init(named: "ic_switch_online")
            thumbButton.isSelected = true
        }
        
        delegate?.thumbDidTouch(self.thumbButton)
    }
}
