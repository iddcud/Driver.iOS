//
//  ConfirmViewController.swift
//  P2MEDriver
//
//  Created by Q on 24/03/2019.
//  Copyright © 2019 DenisBaturitskiyDev. All rights reserved.
//

import UIKit
import PinCodeTextField

class ConfirmViewController: UIViewController {

    @IBOutlet var confirmTextField: PinCodeTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        confirmTextField.delegate = self
        confirmTextField.keyboardType = .numberPad
        confirmTextField.keyboardAppearance = .dark
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(0)) {
            self.confirmTextField.becomeFirstResponder()
        }
    }
    
    // MARK: -
    // MARK: - API Call
    
    func sendCode(code: String) {
        let confirmRequest = ConfirmRequest.init(tokenCode: confirmTextField.text, consumerEmail: UserDefaults.standard.string(forKey: "e-mail"))
        let confirmParams = try! confirmRequest.toDictionary()
        
        let webService = WebService.init()
        webService.POSTQuery(endpoint: URLs.confirm_auth, params: confirmParams, success: { (response) in
            if let data = response as? Data {
                let confirmResponse = try? JSONDecoder().decode(ConfirmResponse.self, from: data)
                if confirmResponse?.data?.token != "" {
                    self.dismiss(animated: true, completion: {
                        UserDefaults.standard.set(confirmResponse?.data?.token, forKey: "token")
                        Switcher.updateRootVC()
                    })
                } else {
                    self.showWrongCodeAlert()
                }
            }
        })
        { (error) in
            print(error ?? "error")
        }
    }
    
    func showWrongCodeAlert() {
        let alert = UIAlertController(title: "Incorrect code", message: "Please, try again", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
        
        confirmTextField.text?.removeAll()
        confirmTextField.becomeFirstResponder()
    }
}

extension ConfirmViewController: PinCodeTextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: PinCodeTextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: PinCodeTextField) {
        
    }
    
    func textFieldValueChanged(_ textField: PinCodeTextField) {
        let value = textField.text ?? ""
        print("value changed: \(value)")
    }
    
    func textFieldShouldEndEditing(_ textField: PinCodeTextField) -> Bool {
        sendCode(code: textField.text ?? "")
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: PinCodeTextField) -> Bool {
        return true
    }
}
