//
//  CategoriesVC.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 31/10/2024.
//

import UIKit

class CategoriesVC: UIViewController {
    
    @IBOutlet weak var categoriesCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        
    }
    
    
    
    
}


extension CategoriesVC {
    
    func initUI() {
        
        
        categoriesCV
            .configureCollectionView(
                delegate: self,
                dataSource: self,
                cellType: CategoriesCVCell.self,
                cellName: .CategoriesCVCell)
        
    }
    

}

extension CategoriesVC: UICollectionViewDelegate {
    
    
}

extension CategoriesVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(cellType: CategoriesCVCell.self,index: indexPath)
        
        return cell
    }
    
    
}

extension CategoriesVC : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // number Of cells In row
        let numberOfCellInRow: CGFloat = 2
        // spacing Between Cells
        let spacing  = (
            collectionViewLayout as? UICollectionViewFlowLayout)?.minimumLineSpacing ?? 0
        // value width
        let width = floor(collectionView.bounds.width - spacing * (numberOfCellInRow - 1)) / numberOfCellInRow
        let hight = width * 0.8092105263
        return CGSize(width: width, height: hight)
        
    }
    

}
