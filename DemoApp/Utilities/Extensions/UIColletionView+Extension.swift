//
//  UIColletionView+Extension.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 21/11/2024.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func configureCollectionView<T: UICollectionViewCell>(delegate: UICollectionViewDelegate , dataSource: UICollectionViewDataSource , cellType: T.Type , cellName: CVCellEnum) {
        self.delegate = delegate
        self.dataSource = dataSource
        self.register(
            UINib(nibName: String(describing: cellType), bundle: nil),
            forCellWithReuseIdentifier: cellName.rawValue
        )
        
    }
    
    func dequeueReusableCell<T: UICollectionViewCell> ( cellType: T.Type ,index: IndexPath) -> T {
        
        guard let cell = dequeueReusableCell(
            withReuseIdentifier: String(describing: cellType),for: index) as? T else {
            fatalError("Could not dequeue cell with identifier: \(String(describing: cellType))")
        }
        return cell
    }
    
    func calculateCellSize(numberOfCellsInRow: CGFloat , spacing: CGFloat) -> CGSize {
        let width = floor(self.bounds.width - spacing * (numberOfCellsInRow - 1)) / numberOfCellsInRow
            return CGSize(width: width, height: width)

        }
}
