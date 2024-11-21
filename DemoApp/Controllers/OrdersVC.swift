//
//  OrdersVC.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 15/11/2024.
//

import UIKit

class OrdersVC: UIViewController {
    
    @IBOutlet weak var orderTV: UITableView!
    
    var orderList: [Orders] = [
        Orders(orderData: "09/10/2019", orderNumber: "Order No. 105", orderPrice: "450.630 KWD", orderState: .Delivered),
        Orders(orderData: "09/10/2019", orderNumber: "Order No. 105", orderPrice: "450.630 KWD", orderState: .Processing),
        Orders(orderData: "09/10/2019", orderNumber: "Order No. 105", orderPrice: "450.630 KWD", orderState: .Pending),
        Orders(orderData: "09/10/2019", orderNumber: "Order No. 105", orderPrice: "450.630 KWD", orderState: .Cancelled)
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    
}

extension OrdersVC {
    
    func initUI() {
        initTV(tv: orderTV)
    }
    
    func initTV(tv: UITableView){
        tv.configureTableView(delqate: self, dataSource: self, cellType: OrdersTvCell.self, cellIdentifier: .OrdersTvCell)
    }
}

extension OrdersVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(index: indexPath, cellType: OrdersTvCell.self)
        let data  = orderList[indexPath.row]
        cell.initCell(cellData: data)
        return cell
    }
    
}

extension OrdersVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 117
    }
    
}
