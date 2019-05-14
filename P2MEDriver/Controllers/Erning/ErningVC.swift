//
//  ErningVC.swift
//  P2MEDriver
//
//  Created by user on 24.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import UIKit

class ErningVC: UIViewController {
   
    // MARK: - IBOutlets
    @IBOutlet weak var topContainterView: ErningContainerView!
    @IBOutlet weak var tripsTableview: UITableView!

    // MARK: - Properties
    var orderArray = [OrderListData]()
    var currentRow = IndexPath(row: 0, section: 1)
    var erningTableViewCell = ErningTableViewCell()
    
    // MARK: -
    // MARK: - ViewController Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
//        getOrderList()
    }
    
    // MARK: - API methods
    
//    func getOrderList() {
//        self.orderArray.removeAll()
//
//        let webService = WebService.init()
//        webService.GETQuery(endpoint: URLs.order_list, success: { (response) in
//            if let data = response as? Data {
//                let orderListResponse = try? JSONDecoder().decode(OrderListResponse.self, from: data)
//                for dict in orderListResponse! {
//                    self.orderArray.append(dict)
//                }
//                self.tripsTableview.reloadSections(IndexSet(integersIn: 0...0), with: .automatic)
//            } else {
//                print("no_order")
//            }
//        }) { (error) in
//                print(error ?? "error")
//            }
//        }
    
//    func getOrderByID(orderID: String) {
//        self.orderArray.removeAll()
//        
//        let webService = WebService.init()
//        webService.GETQuery(endpoint: URLs.order_list + orderID, success: { (response) in
//            if let data = response as? Data {
//                let orderListResponse = try? JSONDecoder().decode(OrderResponse.self, from: data)
//                
//                let currentCell = self.tripsTableview.cellForRow(at: self.currentRow) as! ErningTableViewCell
//                currentCell.deliveryUserName.text = orderListResponse?.consumer
//            } else {
//                print("no_order_by_id")
//            }
//        }) { (error) in
//            print(error ?? "error")
//        }
//    }
}

// MARK: - UITableViewDataSource

extension ErningVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        erningTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ErningTableViewCell", for: indexPath) as! ErningTableViewCell
        erningTableViewCell.timeLabel.text = orderArray[indexPath.row].timeToDelivery?.replacingOccurrences(of: "Z", with: " ")
        erningTableViewCell.deliveryTo.text = orderArray[indexPath.row].address
        erningTableViewCell.priceDeliveryLabel.text = String(orderArray[indexPath.row].priceToDelivery ?? 0)
//        erningTableViewCell.deliveryMethodsLabel.text = orderArray[indexPath.row].
//        erningTableViewCell.deliveryFrom.text = orderArray[indexPath.row].from
//        erningTableViewCell?.deliveryUserName.text = orderArray[indexPath.row].name
        
        return erningTableViewCell
    }
}

// MARK: - UITableViewDelegate

extension ErningVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == currentRow {
            return 210.0
        } else {
            return 60.0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentRow = indexPath
        self.tripsTableview.reloadRows(at: [indexPath], with: .automatic)
        erningTableViewCell.detailInformationView.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.tripsTableview.reloadRows(at: [indexPath], with: .automatic)
        erningTableViewCell.detailInformationView.isHidden = true
    }
}
