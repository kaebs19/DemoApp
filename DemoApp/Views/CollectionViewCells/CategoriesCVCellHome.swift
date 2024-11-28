//
//  CategoriesCVCellHome.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 26/11/2024.
//

import UIKit

class CategoriesCVCellHome: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        mainView.addRadus(radius: 16)
        mainView.clipsToBounds = true
    }


    
}
