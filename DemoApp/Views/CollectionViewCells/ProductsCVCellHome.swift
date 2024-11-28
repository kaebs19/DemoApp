//
//  ProductsCVCellHome.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 26/11/2024.
//

import UIKit

class ProductsCVCellHome: UICollectionViewCell {
    
    @IBOutlet weak var prudctsImage: UIImageView!
    @IBOutlet weak var shadowImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        prudctsImage.addRadus(radius: 15)
        shadowImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

}
