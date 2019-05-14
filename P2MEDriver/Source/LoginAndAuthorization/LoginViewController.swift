//
//  LoginViewController.swift
//  P2MEDriver
//
//  Created by user on 23.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import UIKit
import PickerButton
import SwiftPhoneNumberFormatter

class LoginViewController: UIViewController {
    
    @IBOutlet var pickerButton: PickerButton!
    @IBOutlet var pickerButtonTitle: UILabel!
    @IBOutlet var textField: PhoneFormattedTextField!
    
    var pickerViewSelectedValue = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
    }
    
    func initViews() {
        // PickerView
        pickerButton.titleLabel?.isHidden = true
        pickerButton.delegate = self
        pickerButton.dataSource = self
        pickerButton.closeButtonTitle = "Done"
        pickerButton.tintColor = .black
        
        // TextField Phone Mask
        textField.config.defaultConfiguration = PhoneFormat(defaultPhoneFormat: "(###) ###-##-##")
        textField.prefix = "+7 "
    }
    
    // MARK: - IBAction
    
    @IBAction func loginButton(_ sender: UIButton) {
        if textField.text == "" {
            textField.attributedPlaceholder = NSAttributedString(string: "This field is required",
                                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            return
        }
        
        sendAuthRequest()
    }
    
    // MARK: - API methods
    
    func sendAuthRequest() {
        let authRequest = AuthRequest.init(consumerEmail: textField.text)
        let authParams = try! authRequest.toDictionary()
        
        let webService = WebService.init()
        webService.POSTQuery(endpoint: URLs.auth, params: authParams, success: { (response) in
            if let data = response as? Data {
                if let responseString = String(data: data, encoding: .utf8) {
                    print(responseString)
                    UserDefaults.standard.set(self.textField.text, forKey: "e-mail")
                    self.showConfirmVC()
                } else {
                    self.showErrorAlert()
                }
            }
        })
        { (error) in
            print(error ?? "error")
        }
    }
    
    func showConfirmVC() {
        let confirmVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ConfirmViewController") as! ConfirmViewController
        present(confirmVC, animated: true, completion: nil)
    }
    
    func showErrorAlert() {
        let alert = UIAlertController(title: "Error", message: "Incorrect e-mail address", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}


extension LoginViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Choose city"
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        pickerViewSelectedValue = pickerViewData[row].id!
        
        pickerView.endEditing(true)
    }
}

