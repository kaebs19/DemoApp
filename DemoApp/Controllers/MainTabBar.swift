//
//  TabBars.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 31/10/2024.
//

import UIKit

class MainTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarHidden(true)
        tabBarUI()
    }
    
    func tabBarUI(){
        addShadowToTabBar()
    }
    
     func addShadowToTabBar(){
         tabBar.addShadow(color: .CF8F8F8_TabBar, opacity: 0.4, radius: 4, offset: CGSize(width: 1, height: 1))
         
         tabBar.isTranslucent = false
         tabBar.layer.backgroundColor = UIColor.white.cgColor

    }
    

    }
    

