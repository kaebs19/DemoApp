//
//  AddressesTVCell.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 19/11/2024.
//

import UIKit


protocol AddressesTvCellProtocol: NSObjectProtocol {
    func isSelectButTaped(cellIndex:Int)
}

class AddressesTvCell: UITableViewCell {
    @IBOutlet weak var addressNameLbl: UILabel!
    @IBOutlet weak var addressDetailsLbl: UILabel!
    @IBOutlet weak  var isSelectedLbl: UILabel!
    @IBOutlet weak  var isSelectedImg: UIImageView!
    
    var index = 0
    weak var dellgate: AddressesTvCellProtocol?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    @IBAction func isSelectButTaped(sender: UIButton) {
        dellgate?.isSelectButTaped(cellIndex: index)
        
    }
    
    
}

extension AddressesTvCell {
    func initCell(cellData:Addres) {
        addressNameLbl.custmeLable(text: cellData.titleAddress, ofSize: 14, color: .C454545_Black, typeStyle: .semibold)
        addressDetailsLbl.custmeLable(text: cellData.detailAddress, ofSize: 14, color: .C58595B_black, typeStyle: .regular)
        if cellData.isSelected {
            isSelectedLbl.custmeLable(text: "Default", ofSize: 12, color: .C0079FB_blue, typeStyle: .regular)
            
        } else {
            isSelectedLbl.custmeLable(text: "Default", ofSize: 12, color: .CBFBFBF_gry, typeStyle: .regular)
            
        }
        
        // updata colors lable or image
        let lableColer:Colors = cellData.isSelected ? Colors.C0079FB_blue : Colors.CBFBFBF_gry
        let imageName: Images = cellData.isSelected ? Images.SELECT_IMG : Images.UN_SELECT_IMG
        let image: UIImage? =   imageName.image
        isSelectedLbl.custmeLable(text: "Default", ofSize: 12,
                                  color: lableColer, typeStyle: .regular)
        isSelectedImg.image = image
        
    }
}
