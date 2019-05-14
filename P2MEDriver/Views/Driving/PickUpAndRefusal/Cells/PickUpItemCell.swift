//
//  dsdas.swift
//  P2MEDriver
//
//  Created by user on 17.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//
import UIKit

class PickUpItemCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var numberItemLabel: UILabel!
    @IBOutlet weak var nameItemLabel: UILabel!
    @IBOutlet weak var quantityItemLabel: UILabel!
    
    // MARK: - Properties
    
    // MARK: -
    // MARK: - Cell Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    // MARK: -
    // MARK: - Configurate
    func configurateCell(itemModel: PickUpItemModel, numberItem: Int) {
        numberItemLabel.text = String(numberItem)
        nameItemLabel.text = itemModel.itemName
        quantityItemLabel.text = itemModel.quantity
    }
    
    // MARK: - State
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}




