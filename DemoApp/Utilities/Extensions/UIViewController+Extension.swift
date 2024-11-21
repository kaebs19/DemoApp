//
//  Extension+ViewContrllers.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 31/10/2024.
//

import UIKit


extension UIViewController {
    
    func navigateToController( identifier: Identifier , storyboardName: Storyboards) {
        
        
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: identifier.rawValue) as? UIViewController else {
            print("Could not instantiate view controller with identifier: \(identifier.rawValue)")
            return }
        guard let navigationController = self.navigationController else {
            print("Could not find navigation controller")
            return }
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navigateToBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func setNavigationBarHidden(_ isHide: Bool)  {
        navigationController?.isNavigationBarHidden = isHide
    }
}
