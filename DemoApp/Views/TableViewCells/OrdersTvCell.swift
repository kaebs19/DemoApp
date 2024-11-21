//
//  OrdersCell.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 15/11/2024.
//

import UIKit

class OrdersTvCell: UITableViewCell {
    
    @IBOutlet weak var minView: UIView!
    @IBOutlet weak var dataLab: UILabel!
    @IBOutlet weak var statusLab: UILabel!
    @IBOutlet weak var priceLab: UILabel!
    @IBOutlet weak var numberLab: UILabel!
    @IBOutlet weak var statusImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }

  
}

extension OrdersTvCell {
    
    func initUI() {
        minView.addBoder(color: .CD9D9D9_Gray, wight: 1)
        minView.addRadus(radius: 8)
        
    }
    
    func initCell(cellData: Orders) {
        dataLab.custmeLable(text: cellData.orderData, ofSize: 14, color: .C989898_Gray, typeStyle: .regular)
        priceLab.custmeLable(text: cellData.orderPrice, ofSize: 14, color: .C0079FB_blue, typeStyle: .regular)
        numberLab.custmeLable(text: cellData.orderNumber, ofSize: 14, color: .C58595B_black, typeStyle: .regular)
        
        
        
        var stateColor: Colors
        let stateImage: UIImage? = UIImage(named: "Path")
        let stateText: String
    
        switch cellData.orderState {
        case .Delivered:
            stateText = "Delivered"
            stateColor = .C24955C_green
        case .Pending:
            stateText = "Pending"
            stateColor = .CDB0000_red
        case .Cancelled:
            stateText = "Cancelled"
            stateColor = .C454545_Black

        case .Processing:
            stateText = "Processing"
            stateColor = .C0079FB_blue

        }
        statusLab.custmeLable(text: cellData.orderState.rawValue, ofSize: 12, color: stateColor, typeStyle: .regular)
        statusImg.image = stateImage
        statusImg.tintColor = stateColor.uiColor
        
        
    }
}
