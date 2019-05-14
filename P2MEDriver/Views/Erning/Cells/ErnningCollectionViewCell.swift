//
//  ErnningCollectionViewCell.swift
//  P2MEDriver
//
//  Created by user on 24.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import UIKit

class ErnningCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var totalDeliveryPriceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    // MARK: - Properties
    
    
    // MARK: -
    // MARK: - Configurate cell
    func configureCellWithModel(_ model: DriverErning) {
        totalDeliveryPriceLabel.text = model.erningDriver
        timeLabel.text = model.erningMethods
    }
    
}
