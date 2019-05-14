//
//  CallAndMessageView.swift
//  P2MEDriver
//
//  Created by user on 16.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import UIKit

enum CallAndMessageViewOpenWith {
    case call
    case message
}

class CallAndMessageView: UIView {

    // MARK: - IBOutlets
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userProneNumberLabel: UILabel!
    @IBOutlet weak var userActionButton: UIButton!

    @IBOutlet weak var heightConstraint: NSLayoutConstraint! // close 0 / open 90
    
    // MARK: - Properties
    var viewIsHiden = true
    var userModel: ConfirmDriverModel?
    var openWithMethods: CallAndMessageViewOpenWith?
    let hightView: CGFloat = 90
    var tabBarInfo: CustomTabInfoDelegate?

    var phoneNumber: String?
    
    // MARK: -
    // MARK: - LC View
    override func draw(_ rect: CGRect) {
        self.isHidden = viewIsHiden
    }
    
    // MARK: -
    // MARK: - Configurate Methods
    func configurateStartState() {
        viewIsHiden = true
        userModel = nil
        openWithMethods = nil
        self.isHidden = true
    }
    
    func viewWithInformation(_ isHiden: Bool, withMethods: CallAndMessageViewOpenWith) {
        configureWithMethods(methods: withMethods)
        animationOpenAndClose(isHiden: isHiden, withMethods: withMethods, fromClose: false)
    }
    
    func configureWithMethods(methods: CallAndMessageViewOpenWith) {
        openWithMethods = methods
        if let user = userModel {
            if let imageStr = user.userImage { userImageView.image = UIImage(named: imageStr) }
            if let text = user.userFullName { userNameLabel.text = text }
            if let phoneNumber = user.userPhoneNumber { userProneNumberLabel.text = phoneNumber }
            if let phoneNumberUser = user.userPhoneNumber { phoneNumber = phoneNumberUser  }
        } else {
            userNameLabel.text = "Dorafei Explorer"
            userProneNumberLabel.text = "+44 (213) 215 5511"
        }
        
        switch methods {
        case CallAndMessageViewOpenWith.call:    // config call view
            userActionButton.setImage(#imageLiteral(resourceName: "DriverIconCallButton.png"), for: .normal)
        case CallAndMessageViewOpenWith.message: // config message view
            userActionButton.setImage(#imageLiteral(resourceName: "DriverIconMessageButton.png"), for: .normal)
        }
    }

    // MARK: -
    // MARK: - Action methods
    @IBAction func callOrMessage(_ sender: UIButton) {
        if let methods = openWithMethods {
            switch methods {
            case .call:
                print("Call")
                if let number = phoneNumber { number.makeAColl() }
            case .message:
                print("Message")
            }
        }
    }
    
    // MARK: - Other methods
    private func callNumber(phoneNumber:String) {
        
    }
    
    // MARK: -
    // MARK: - Animation Methods
    func animationOpenAndClose(isHiden: Bool, withMethods: CallAndMessageViewOpenWith, fromClose: Bool) {
        if isHiden == true {
            frame = CGRect(x: frame.origin.x, y: frame.origin.y + (fromClose ? 0 : hightView), width: frame.width, height: frame.height)
            self.isHidden = !isHiden
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            self.frame = CGRect(x: self.frame.origin.x, y: isHiden ? self.frame.origin.y - self.hightView : self.frame.origin.y + self.hightView, width: self.frame.width, height: self.frame.height)
        }) { (true) in
            if isHiden == false {
                self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y - self.hightView, width: self.frame.width, height: self.frame.height)
            }
            self.isHidden = !isHiden
            self.layoutIfNeeded()
        }
        viewIsHiden = !isHiden
    }
    
    func closeAndOpenAnimation(_ isHiden: Bool, withMethods: CallAndMessageViewOpenWith) {
        UIView.animate(withDuration: 0.3, animations: {
            self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y + self.hightView, width: self.frame.width, height: self.frame.height)
        }) { (true) in
            self.configureWithMethods(methods: withMethods)
            self.layoutIfNeeded()
            self.isHidden = !isHiden
            self.viewIsHiden = !isHiden
            self.animationOpenAndClose(isHiden: !isHiden, withMethods: withMethods, fromClose: true)
        }
      
    }
    
    func closeView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y + self.hightView, width: self.frame.width, height: self.frame.height)
        }) { (true) in
            self.layoutIfNeeded()
            self.isHidden = true
            self.viewIsHiden = true
            self.tabBarInfo?.closeViewWithCallAndMessageAndOpenInfo()
        }
    }
}
