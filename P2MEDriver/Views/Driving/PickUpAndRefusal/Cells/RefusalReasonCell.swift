//
//  adsasd.swift
//  P2MEDriver
//
//  Created by user on 17.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//
import Foundation
import UIKit



class RefusalReasonCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var reasonLabel: UILabel!
    @IBOutlet weak var checkImageView: UIImageView!
    
    // MARK: - Properties
    var reasonId: Int?
    var reasonDelegate: backRefusialIdDelegate?
    
    // MARK: -
    // MARK: - Cell Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    // MARK: -
    // MARK: - Configurate
    func configurateCell(model: ReasonModel){
        reasonLabel.text = model.reasonName
        reasonId = model.reasonId
    }
    
    func configurateSelectImage() {
        checkImageView.image = #imageLiteral(resourceName: "DriverIconReasonTrue.png")
    }
    
    func configurateDeselectImage() {
        checkImageView.image = #imageLiteral(resourceName: "DriverIconReasonNone.png")
    }
    
}
