//
//  CustumTabBarProtocols.swift
//  P2MEDriver
//
//  Created by user on 16.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import Foundation

protocol CustomTabBarDelegate {
    func viewWithCallAndMessageOpen(withMethods: CallAndMessageViewOpenWith)
    func closeViewWithCallAndMessageForInfoOpen()
}

protocol CustomTabInfoDelegate {
    func closeViewWithCallAndMessageAndOpenInfo()
}

