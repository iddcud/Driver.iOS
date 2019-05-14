//
//  ErningTableViewCell.swift
//  P2MEDriver
//
//  Created by user on 24.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import UIKit

enum CellHeight: CGFloat{
    case openCell = 210
    case closeCell = 60
}


class ErningTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var deliveryMethodsLabel: UILabel!
    @IBOutlet weak var priceDeliveryLabel: UILabel!
    @IBOutlet weak var detailInformationView: UIView!
    @IBOutlet weak var buttonImageView: UIImageView!
    
    @IBOutlet weak var deliveryFrom: UILabel!
    @IBOutlet weak var deliveryTo: UILabel!
    @IBOutlet weak var deliveryUserName: UILabel!
    
}
