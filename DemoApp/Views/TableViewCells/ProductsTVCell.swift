//
//  ProductsTVCell.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 20/11/2024.
//

import UIKit

protocol ProductsTVCellProtocol: NSObjectProtocol {
    func isFavoriteButtonTapped(cellIndex: Int)
}


class ProductsTVCell: UITableViewCell {
    
    @IBOutlet var productBoderImage: [UIImageView]!
    
    @IBOutlet weak var prductNameLabel: UILabel!
    @IBOutlet weak var prductPriceLabLabel: UILabel!
    @IBOutlet weak var isFavoriteButton: UIButton!
    
    var cellIndex: Int = 0
    weak var delegate: ProductsTVCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
        noSelectionStyleCell()
    }

    @IBAction func isFavoriteButtonTapped(_ sender: UIButton) {
    
        delegate?.isFavoriteButtonTapped(cellIndex: cellIndex)
    }
  
    
}

extension ProductsTVCell {
    
    func initUI() {
        productBoderImage.forEach { images in
            images.addRaduis(18)
        }
    }
    
    func initCell(cellData: Prduct) {
        prductNameLabel
            .custmeLable(
                text: cellData.prductName,
                ofSize: 16,
                color: .C454545_Black,
                typeStyle: .regular
            )
        prductPriceLabLabel
            .custmeLable(
                text: "6.34 kwd",
                ofSize: 16,
                color: .C454545_Black,
                typeStyle: .semibold
            )
        
        
        let imageName = cellData.isFav  ? Images.STAR_SEL_IMG.image: Images.STAR_UNSEL_IMG.image
        isFavoriteButton.setImage(imageName, for: .normal)
        
        
    }
    
}
