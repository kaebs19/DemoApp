//
//  UITableView+Extensions.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 15/11/2024.
//

import UIKit


extension UITableView  {
    
    func configureTableView<T: UITableViewCell>
    (delqate: UITableViewDelegate,
     dataSource: UITableViewDataSource,
     cellType: T.Type , cellIdentifier: TVCell) {
            
        self.delegate = delqate
        self.dataSource = dataSource
        self.register(UINib(nibName: String(describing: cellType), bundle: nil), forCellReuseIdentifier: cellIdentifier.rawValue)
        self.reloadData()
    }
    
    func configureSeparator(inset: CGFloat
                            ,style: UITableViewCell.SeparatorStyle){
        
        self.separatorInset = UIEdgeInsets(
            top: inset,
            left: inset,
            bottom: inset,
            right: inset)
        self.separatorStyle = style
    
            
    }
    
    func hideScrollTableView( hide: Bool){
        self.showsVerticalScrollIndicator = hide
    }
    
    
    func dequeueCell<T: UITableViewCell>(index: IndexPath, cellType: T.Type) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: cellType), for: index) as? T else {
            fatalError("Could not dequeue cell with identifier: \(String(describing: cellType))")
        }
        return cell
    }
    

}


extension UITableViewCell {
    
    func noSelectionStyleCell () {
        self.selectionStyle = .none
    }

}
