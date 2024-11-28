//
//  HomeVC.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 26/11/2024.
//

import UIKit

class HomeVC: UIViewController {
    // MARK: - Outlets

    @IBOutlet weak var sliderCV: UICollectionView!
    @IBOutlet weak var categoriesCV: UICollectionView!
    @IBOutlet weak var productsCV: UICollectionView!
    @IBOutlet weak var sliderPageControl: UIPageControl!
    
    // MARK: - Variables
    var productsList = ["slider1_img" , "slider2_img" , "slider3_img" , "slider4_img"]
    var currentIndex:Int = 0
    var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    
    
}

extension HomeVC {
    func initUI() {
        
        sliderPageControl.numberOfPages = productsList.count
        initTimer()
        initCVCell(collctionView: sliderCV, cellType: SliderCVCellHome.self)
        initCVCell(collctionView: categoriesCV,cellType: CategoriesCVCellHome.self)
        initCVCell(collctionView: productsCV, cellType: ProductsCVCellHome.self)
        
    }
    
    func initCVCell<T:UICollectionViewCell>(collctionView:UICollectionView , cellType:T.Type) {
        collctionView
            .registerCVNib(cell: cellType, delegate: self, dataSource: self)
    }
    
    func initTimer() {
        timer = Timer
            .scheduledTimer(
                timeInterval: 3.0,
                target: self,
                selector: #selector(sliderTimer),
                userInfo: self,
                repeats: true
            )
    }
    
    @objc func sliderTimer() {
        print("Done")
        
        currentIndex = (currentIndex < productsList.count - 1) ? currentIndex + 1 : 0
        
        
        sliderCV.scrollToItem(
                at: IndexPath(item: currentIndex, section: 0),
                at: .centeredHorizontally,
                animated: true
            )
    }
    
}


extension HomeVC:UICollectionViewDelegate {
    
}

extension HomeVC:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView.tag {
                
            case 0:
                return productsList.count
            case 1:
                return 10
            default:
                return 12
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch collectionView.tag {
            case 0:
                let cell = collectionView.dequeueReusableCell(
                    cellName: .SliderCVCellHome,
                    cellType: SliderCVCellHome.self,
                    index: indexPath
                )
                cell.sliderImg.image = UIImage(
                    named: productsList[indexPath.item]
                )
                return cell
                
            case 1:
                let cell = collectionView.dequeueReusableCell(
                    cellName: .CategoriesCVCellHome,
                    cellType: CategoriesCVCellHome.self,
                    index: indexPath
                )
                return cell
            default :
                let cell = collectionView.dequeueReusableCell(
                    cellName: .ProductsCVCellHome,
                    cellType: ProductsCVCellHome.self,
                    index: indexPath
                )
                return cell
                
        }
        
    }
    
    
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView.tag {
            case 0:
                let collectionViewwidth = collectionView.bounds.width
                let collectionViewHeight = collectionView.bounds.height
                return CGSize( width: collectionViewwidth, height: collectionViewHeight )
                
            case 1:
                let collectionViewWidth = collectionView.bounds.width
                
                let numberOfCellsInRow:CGFloat = 2
                let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
                let spacingBetweenCells = flowLayout.minimumInteritemSpacing * (numberOfCellsInRow - 1)
                let adjustedWidth = collectionViewWidth - spacingBetweenCells
                let width = floor(adjustedWidth/numberOfCellsInRow)
                return CGSize(width: width, height: width * 0.6993464052)
                            
            default:
                let collectionViewWidth = collectionView.bounds.width
                let collectionViewHeight = collectionView.bounds.height
                return CGSize( width: collectionViewWidth, height: collectionViewHeight  )
                
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        if scrollView == sliderCV {
            currentIndex  = Int(scrollView.contentOffset.x/sliderCV.bounds.width)
            sliderPageControl.currentPage = currentIndex
        }
    }
}
