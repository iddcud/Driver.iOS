//
//  ConfirmDriverVC.swift
//  P2MEDriver
//
//  Created by user on 16.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import UIKit

class ConfirmDriverVC: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var minDrivingLabel: UILabel!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var categoryImageViewl: UIImageView!
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    // MARK: - Properties
    var confirmOrderDelegate : ConfirmDriverDelegate?
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    var confirmModel: ConfirmDriverModel?
    var progressBarTimer = Timer()
    let timerDuration = 11
    var timerDidStart = false
    
    // MARK: -
    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    // MARK: -
    // MARK: - Configure methods
    func configurateVC() {
        if let model = confirmModel {
            let modelCategory = ConfirmDriverModelCategory(categuryID: model.category!)
            minDrivingLabel.text = model.minDriving
            adressLabel.text = model.adress
            categoryNameLabel.text = modelCategory.categoryName
            categoryImageViewl.image = modelCategory.categoryImage
            
            let price = String(model.price!)
            if let index = price.range(of: ".")?.lowerBound {
                let substring = price[..<index]
                
                let attrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
                let priceString = NSAttributedString(string: "You will get ", attributes: attrs)
                
                let attrs2 = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 48)]
                let priceValueString = NSAttributedString(string: String(substring), attributes: attrs2)
                
                let attrs3 = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 26)]
                let currencyString = NSAttributedString(string: " $", attributes: attrs3)
  
                let combination = NSMutableAttributedString()
                combination.append(priceString)
                combination.append(priceValueString)
                combination.append(currencyString)
                
                priceLabel.attributedText = combination
            }
        }
    }
    
    // MARK: -
    // MARK: - Sucsses or fail methods
    func confirmOrderFromDirver() {
        if let model = confirmModel {
            confirmOrderDelegate?.confirmOrderFromDriver(model: model)
        }
        dismiss(animated: true) {
        }
    }
    
    @objc func cancelOrderFromDriver() {
        dismiss(animated: true) {
        }
    }
    
    // MARK: -
    // MARK: - Actions methods
    @IBAction func confirmButton(_ sender: UIButton) {
        if let model = confirmModel {
            let dict: [String : Any] = ["type" : "isTaken",
                                    "order_id" : model.orderID!]
            let jsonData = try! JSONSerialization.data(withJSONObject: dict)
            let jsonString = String(data: jsonData, encoding: .utf8)
        
            if appDelegate.socket.isConnected {
                appDelegate.socket.write(string: jsonString!)
                
                dismiss(animated: true, completion: {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "orderConfirmed"), object: nil, userInfo: nil)
                })
            }
        }
    }
}



