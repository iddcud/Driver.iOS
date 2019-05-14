//
//  ProfileVC.swift
//  P2MEDriver
//
//  Created by user on 17.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func logutButton(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "token")
        Switcher.updateRootVC()
    }

}
