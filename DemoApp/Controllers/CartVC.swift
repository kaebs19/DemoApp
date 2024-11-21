//
//  CartVC.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 19/11/2024.
//

import UIKit


class CartVC: UIViewController {
    
    @IBOutlet weak var cartTV: UITableView!
    
    
    var cartList:[Cart] = [
        
        Cart(productName: "Egyption Medical Headsets", productPrice: "6.34 kwd", count: 1),
        Cart(productName: "Chines Thermomerers", productPrice: "6.34 kwd", count: 1),
        Cart(productName: "Egyption Medical Headsets", productPrice: "6.34 kwd", count: 1),
        Cart(productName: "National Blood ", productPrice: "6.34 kwd", count: 1)

    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    
}

extension CartVC {
    
    func initUI() {
        initTV(tv: cartTV)
    }
    
    func initTV(tv: UITableView) {
        tv
            .configureTableView(
                delqate: self,
                dataSource: self,
                cellType: CartTVCell.self,
                cellIdentifier: .CartTVCell
            )
        tv.configureSeparator(inset: 0, style: .singleLine)
    }
}

extension CartVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cartList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(
            index: indexPath,
            cellType: CartTVCell.self)
        let data  = cartList[indexPath.row]
        cell.initUI(celldata: data)
        cell.delagate = self
        return cell
    }

    
}

extension CartVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 107
    }
}

extension CartVC: CartTVCellProtocol {
    func removeMinusClickedBut(cellIndex: Int) {
        cartList.remove(at: cellIndex)
        cartTV.reloadData()
    }

    func plusClickedBut(cellIndex: Int) {
        
        cartList[cellIndex].count += 1
        cartTV.reloadData()
        
    }

    func miuClickedBut(cellIndex: Int) {
        
        let count = cartList[cellIndex].count
        
        if count > 1 {
            cartList[cellIndex].count -= 1
            cartTV.reloadRows(at: [IndexPath(row: cellIndex, section: 0)], with: .none)
        } else {
            removeMinusClickedBut(cellIndex: cellIndex)
        }
    }

    
    
}
