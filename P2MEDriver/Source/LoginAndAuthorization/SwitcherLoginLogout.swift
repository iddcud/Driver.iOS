//
//  SwitcherLoginLogout.swift
//  P2MEDriver
//
//  Created by user on 23.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import Foundation
import UIKit

class Switcher {
    
    static func updateRootVC(){
        
        let token = UserDefaults.standard.string(forKey: "token")
        var rootVC : UIViewController?
        
        if token != nil {
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomTabBarVC") as! CustomTabBarVC
            print("token = \(token!)")
        } else {
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = rootVC
    }
}
