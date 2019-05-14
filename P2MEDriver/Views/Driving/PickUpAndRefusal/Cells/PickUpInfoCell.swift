//
//  ads.swift
//  P2MEDriver
//
//  Created by user on 17.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import Foundation
import UIKit

class PickUpInfoCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var deliveryCostLabel: UILabel!
    @IBOutlet weak var nameUserLabel: UILabel!
    
    // MARK: - Properties
    
    // MARK: -
    // MARK: - Cell Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    // MARK: -
    // MARK: - Configurate
    func configurateCell(model: PickUpModel) {
        totalPriceLabel.text = model.totalPrice
        deliveryCostLabel.text = model.deliveryCost
        nameUserLabel.text = model.deliveryUserName
    }
    
    // MARK: - State
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}


