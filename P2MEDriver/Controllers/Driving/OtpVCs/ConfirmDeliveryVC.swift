//
//  ConfirmDeliveryVC.swift
//  P2MEDriver
//
//  Created by user on 17.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import UIKit

class ConfirmDeliveryVC: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var labelInstructions: UILabel!
    
    // MARK: - Properties
    var password: String?
    var otpDelegate: OtpAndConfitmDelegate?
    
    // MARK: -
    // MARK: - VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: -
    // MARK: - Configurate password
    func getPasswodFromServer() {
        // managet back  password:Int и в блоке комплитед вызывается метот го некст вс
        let passwordFromServer = "3366"
        password = passwordFromServer
        presentCheckConfirmPassword(password: passwordFromServer)
    }
    
    func presentCheckConfirmPassword(password: String) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "OtpVC") as! OtpVC
        vc.password = password
        vc.otpDelegate = otpDelegate
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // MARK: -
    // MARK: - Actions
    @IBAction func sendPasswordButton(_ sender: UIButton) {
        getPasswodFromServer()
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true) {
        }
    }
}
