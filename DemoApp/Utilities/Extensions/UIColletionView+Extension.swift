//
//  UIColletionView+Extension.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 21/11/2024.
//

    import Foundation
    import UIKit

    extension UICollectionView {
        
        func registerCVNib<Cell: UICollectionViewCell>(cell: Cell.Type , delegate: UICollectionViewDelegate , dataSource: UICollectionViewDataSource) {
            let nibName = String(describing: Cell.self)
            self.delegate = delegate
            self.dataSource = dataSource
            self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
        
            
        }
        
        func dequeueReusableCell<T: UICollectionViewCell> (cellName: CVCellEnum , cellType: T.Type ,index: IndexPath) -> T {
            
            guard let cell = dequeueReusableCell(
                withReuseIdentifier: cellName.identifier,for: index) as? T else {
                fatalError("Could not dequeue cell with identifier: \(String(describing: cellType))")
            }
            return cell
        }
        
        func dequeueCV<Cell: UICollectionViewCell>(index: IndexPath) -> Cell {
            let identifier = String(describing: Cell.self)
            guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: index) as? Cell else {
                fatalError("Error in cell")
            }
            return cell
        }

        
        func calculateCellSize(numberOfCellsInRow: CGFloat , spacing: CGFloat) -> CGSize {
            let width = floor(self.bounds.width - spacing * (numberOfCellsInRow - 1)) / numberOfCellsInRow
                return CGSize(width: width, height: width)

            }
    }
