//
//  CategoriesCVCell.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 21/11/2024.
//

import UIKit

class CategoriesCVCell: UICollectionViewCell {
    
    @IBOutlet weak var mainView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.addRadus(radius: 16)
        mainView.clipsToBounds = true
    }

}
