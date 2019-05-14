//
//  OtpVC.swift
//  P2MEDriver
//
//  Created by user on 17.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import UIKit

class OtpVC: UIViewController, UITextFieldDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var txtOTP4: UITextField!
    @IBOutlet weak var txtOTP3: UITextField!
    @IBOutlet weak var txtOTP2: UITextField!
    @IBOutlet weak var txtOTP1: UITextField!
    
    // MARK: - Properties
    var password: String?
    var otpDelegate: OtpAndConfitmDelegate?

    // MARK: -
    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        startConfigurate()
        if let navVc = navigationController as? CustomNavC {
            otpDelegate = navVc.otpDelegate
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: -
    // MARK: - Other methods
    func checkPassword() {
        var stringFromOtp = ""
        let array = [txtOTP1, txtOTP2, txtOTP3, txtOTP4]
        for txtOTP in array {
            if let text = txtOTP?.text {stringFromOtp.append(text) }
        }
        if stringFromOtp == password {
            otpDelegate?.confirmDeliveryFromDirver()
            navigationController?.dismiss(animated: true, completion: {
                //
            })
        } else {
            animateWrongTxt(textFields: [txtOTP1, txtOTP2, txtOTP3, txtOTP4])
        }
    }
    
    // MARK: -
    // MARK: - Animation Methods
    
    func animateWrongTxt(textFields:[UITextField]) {
        for textField in textFields {
            UIView.animate(withDuration: 0.2, animations: {
                textField.alpha = 0
            }) { (true) in
                UIView.animate(withDuration: 0.2, animations: {
                    textField.alpha = 1
                    textField.text = ""
                }, completion: { (true) in
                    UIView.animate(withDuration: 0.2, animations: {
                        textField.alpha = 0
                    }, completion: { (true) in
                        UIView.animate(withDuration: 0.2, animations: {
                            textField.alpha = 1
                        }, completion: { (true) in
                            // if needed
                        })
                    })
                })
            }
        }
    }
    
    
    // MARK: -
    // MARK: - Action
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func confirmDelivery(_ sender: UIButton) {
        checkPassword()
    }

    
    // MARK: -
    // MARK: - Configurate methods and logic OTP
    func startConfigurate() {
        txtOTP1.backgroundColor = UIColor.clear
        txtOTP2.backgroundColor = UIColor.clear
        txtOTP3.backgroundColor = UIColor.clear
        txtOTP4.backgroundColor = UIColor.clear
        
        addBottomBorderTo(textField: txtOTP1)
        addBottomBorderTo(textField: txtOTP2)
        addBottomBorderTo(textField: txtOTP3)
        addBottomBorderTo(textField: txtOTP4)
        
        txtOTP1.delegate = self
        txtOTP2.delegate = self
        txtOTP3.delegate = self
        txtOTP4.delegate = self
        
        txtOTP1.becomeFirstResponder()
    }
    
    func addBottomBorderTo(textField:UITextField) {
        let layer = CALayer()
        layer.backgroundColor = #colorLiteral(red: 0.9422464967, green: 0.7435478568, blue: 0.1919448674, alpha: 1) // UIColor.gray.cgColor
        layer.frame = CGRect(x: 0.0, y: textField.frame.size.height - 2.0, width: textField.frame.size.width, height: 2.0)
        textField.layer.addSublayer(layer)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if ((textField.text?.count)! < 1 ) && (string.count > 0) {
            if textField == txtOTP1 {
                txtOTP2.becomeFirstResponder()
            }
            
            if textField == txtOTP2 {
                txtOTP3.becomeFirstResponder()
            }
            
            if textField == txtOTP3 {
                txtOTP4.becomeFirstResponder()
            }
            
            if textField == txtOTP4 {
                txtOTP4.resignFirstResponder()
            }
            
            textField.text = string
            return false
        } else if ((textField.text?.count)! >= 1) && (string.count == 0) {
            if textField == txtOTP2 {
                txtOTP1.becomeFirstResponder()
            }
            if textField == txtOTP3 {
                txtOTP2.becomeFirstResponder()
            }
            if textField == txtOTP4 {
                txtOTP3.becomeFirstResponder()
            }
            if textField == txtOTP1 {
                txtOTP1.resignFirstResponder()
            }
            textField.text = ""
            return false
        } else if (textField.text?.count)! >= 1 {
            textField.text = string
            return false
        }
        return true
    }
    
    
}

