//
//  CategoryCVCell.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 22/11/2024.
//

import UIKit

class CategoryCVCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryLable: UILabel!
    @IBOutlet weak var mainView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

extension CategoryCVCell {
    

    func initDataCell(ForData cell: Category) {

        
        let textColor:Colors = cell.isSelected ? .C0079FB_blue : .C454545_Black
        let boderColor: Colors = cell.isSelected ? .C0079FB_blue : .CE2E2E2
        
        categoryLable
            .custmeLable(
                text: cell.title,
                ofSize: 14,
                color: textColor,
                typeStyle: .regular
            )
        
        mainView.addBoder(color: boderColor, wight: 1)
        mainView.addRadus(radius: 10)
        
        
    }
}
