//
//  ProductsVC.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 20/11/2024.
//

import UIKit

class ProductsVC: UIViewController {
    
    @IBOutlet weak var prductsTV: UITableView!
    
    var productsList: [Prduct] = [
        
        Prduct(prductName: "Egyption Blood Glucose...",prductPrice: "6.34 kwd",isFav: true) ,
        Prduct(prductName: "Egyption Blood Glucose...",prductPrice: "6.34 kwd",isFav: false) ,
        Prduct(prductName: "Egyption Blood Glucose...",prductPrice: "6.34 kwd",isFav: false) ,
        Prduct(prductName: "Egyption Blood Glucose...",prductPrice: "6.34 kwd",isFav: false) ,

    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        
    }
    
    
}

extension ProductsVC  {
    
    func initUI() {
        initTV(tv: prductsTV)
    }
    
    func initTV(tv: UITableView) {
        tv
            .configureTableView(
                delqate: self,
                dataSource: self,
                cellType: ProductsTVCell.self,
                cellIdentifier: .ProductsTVCell
            )
        tv.configureSeparator(inset: 0, style: .none)
        tv.hideScrollTableView(hide: false)
        
    }
}

extension ProductsVC : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(
            index: indexPath,
            cellType: ProductsTVCell
                .self)
        let prductData = productsList[indexPath.row]
        cell.initCell(cellData: prductData)
        cell.cellIndex = indexPath.row
        cell.delegate = self
        return cell
    }
    
    
}

extension ProductsVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 272*iPhoneXFactor
    }
    
}

extension ProductsVC : ProductsTVCellProtocol {
    
    func isFavoriteButtonTapped(cellIndex: Int) {
        print(cellIndex)
        productsList[cellIndex].isFav.toggle()
        prductsTV.reloadData()
    }

    
    
}
