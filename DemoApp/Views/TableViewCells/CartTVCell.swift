//
//  CartTVCell.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 19/11/2024.
//

import UIKit

protocol CartTVCellProtocol: NSObjectProtocol {
    func removeMinusClickedBut(cellIndex: Int)
    func plusClickedBut(cellIndex: Int)
    func miuClickedBut(cellIndex: Int)
}

class CartTVCell: UITableViewCell {
    
    @IBOutlet weak var productIma: UIImageView!
    @IBOutlet weak var productNameLib: UILabel!
    @IBOutlet weak var productPriceLib: UILabel!
    @IBOutlet weak var productCountLib: UILabel!
    
    
    var cellIndex: Int = 0
    weak var delagate: CartTVCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        noSelectionStyleCell()
        
    }
    
    @IBAction func removeMinusClickedBut(_ sender: Any) {
        delagate?.removeMinusClickedBut(cellIndex: cellIndex)
    }
    
    @IBAction func plusClickedBut(_ sender: Any) {
        delagate?.plusClickedBut(cellIndex: cellIndex)
    }
    
    @IBAction func miuClickedBut(_ sender: Any) {
        delagate?.miuClickedBut(cellIndex: cellIndex)
    }
}

extension CartTVCell {
    
    func initUI (celldata: Cart) {
        productNameLib
            .custmeLable(
                text: celldata.productName,
                ofSize: 16,
                color: .C454545_Black,
                typeStyle: .regular
            )
        productPriceLib
            .custmeLable(
                text: celldata.productPrice,
                ofSize: 16,
                color: .C58595B_black,
                typeStyle: .semibold
            )
        productCountLib
            .custmeLable(
                text: "\(celldata.count)",
                ofSize: 16,
                color: .C707070_gray,
                typeStyle: .regular
            )
        
    }
    
}

