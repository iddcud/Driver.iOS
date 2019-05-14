//
//  PickUpAndRefusalVC+EXT.swift
//  P2MEDriver
//
//  Created by user on 17.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import UIKit
import Foundation

extension PickUpAndRefusalVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if navigationBarTwoLines == true {
            if pickUpModels != nil {
                return (pickUpModels?.items?.count)! + 1
            } else {
                return 0
            }
        } else {
            return reasonModels?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if navigationBarTwoLines == true {
            
            if indexPath.row < (pickUpModels?.items?.count)! {
                let cell = tableView.dequeueReusableCell(withIdentifier: "PickUpItemCell") as! PickUpItemCell
                if let model = pickUpModels { cell.configurateCell(itemModel: model.items![indexPath.row], numberItem: indexPath.row + 1) }
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "PickUpInfoCell") as! PickUpInfoCell
                if let model = pickUpModels { cell.configurateCell(model: model) }
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RefusalReasonCell") as! RefusalReasonCell
            if let model = reasonModels { cell.configurateCell(model: model[indexPath.row]) }
            return cell
        }
    }
    
}  //i5 128 8 570

extension PickUpAndRefusalVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if navigationBarTwoLines == true {
            if indexPath.row < (pickUpModels?.items?.count)! {
                return 25
            } else {
                return 150
            }
        } else {
            return 35
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if navigationBarTwoLines == false {
            if let cell = tableView.cellForRow(at: indexPath) as? RefusalReasonCell {
                cell.configurateSelectImage()
                reasonId = cell.reasonId
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if navigationBarTwoLines == false {
            if let cell = tableView.cellForRow(at: indexPath) as? RefusalReasonCell {
                cell.configurateDeselectImage()
            }
        }
    }
}

