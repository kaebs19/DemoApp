//
//  CategoriesVC.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 31/10/2024.
//

import UIKit

class CategoriesVC: UIViewController {
    
    @IBOutlet weak var productCV: UICollectionView!
    @IBOutlet weak var categoryCV: UICollectionView!
    
    
    var categoriesList: [Category] = [
        Category(title: "Ali", isSelected: true),
        Category(title: "Catrgory one", isSelected: false),
        Category(title: "Category two", isSelected: false),
        Category(title: "Category three", isSelected: false),
        Category(title: "Other", isSelected: false)

    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        
    }
    
    
    
    
}


extension CategoriesVC {
    
    func initUI() {
        productCV
            .registerCVNib(
                cell: ProductsCVCell.self,
                delegate: self,
                dataSource: self
            )
        
        categoryCV
            .registerCVNib(
                cell: CategoryCVCell.self,
                delegate: self,
                dataSource: self
            )
        
    }
    
}

extension CategoriesVC: UICollectionViewDelegate {
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        for index in 0..<categoriesList.count {
            categoriesList[index].isSelected = false
        }
        categoriesList[indexPath.row].isSelected = true
        categoryCV.reloadData()
    }
    
}

extension CategoriesVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView.tag {
            case 0:
                return categoriesList.count
                
            default:
                return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView.tag {
            case 0:
                let cell = collectionView.dequeueReusableCell(
                    cellName: .CategoryCVCell, cellType: CategoryCVCell.self,
                    index: indexPath
                )
                let dataCategory = categoriesList[indexPath.row]
                cell.initDataCell(ForData: dataCategory)
                return cell
                
            default :
                let cell = collectionView.dequeueReusableCell(
                    cellName: .ProductsCVCell, cellType: ProductsCVCell.self,
                    index: indexPath
                )
                return cell
                
        }
    }
    
}

extension CategoriesVC : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        
        switch collectionView.tag {
            case 0:
                let collectionHeight = collectionView.bounds.height
                let collectionWidth = calcuaterCellWidth(
                    for: categoriesList[indexPath.row].title)
                
                return CGSize(width: collectionWidth, height: collectionHeight)
                
            default :
                // number Of cells In row
                let numberOfCellInRow: CGFloat = 2
                // spacing Between Cells
                let spacing  = (
                    collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0
                // value width
                let width = floor(collectionView.bounds.width - spacing * (numberOfCellInRow - 1)) / numberOfCellInRow
                let hight = width * 0.8092105263
                return CGSize(width: width, height: hight)
                
        }
        
        
    }
    private func calcuaterCellWidth(for text: String) -> CGFloat {
        guard let cell = Bundle.main.loadNibNamed("CategoryCVCell",owner: self)?.first as? CategoryCVCell else {
            return 0.0
        }
        cell.categoryLable.text = text
        let fittingSize = CGSize(width: UIView.layoutFittingCompressedSize.width, height: cell.bounds.height )
        let size = cell.contentView.systemLayoutSizeFitting(fittingSize)
        return size.width
        
    }
    
}
