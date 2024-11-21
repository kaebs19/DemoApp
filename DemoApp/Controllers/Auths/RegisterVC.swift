//
//  ViewController.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 27/10/2024.
//

import UIKit
import SideMenu

class RegisterVC: UIViewController {

    @IBOutlet var bigView:[UIView]!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var changeImg: UIImageView!
    
    @IBOutlet weak var iAgreeLab: UILabel!
    
    var isSelected:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    @IBAction func selectedAgree (_ sender: UIButton) {
        isSelected.toggle()
        changeImg.image = UIImage(named: isSelected ? "check_sel" : "check_unsel_sel")
        print(isSelected)
    }
    
    @IBAction func registerBtnTapped (_ sender: UIButton) {
        print("Done Tapped !!")
    }

    
    @IBAction func goToBackBtnTapped (_ sender: UIButton) {
        print("go to back")
        navigateToBack()
    }
}



extension RegisterVC {
    
    func initUI() {
        setNavigationBarHidden(true)
        bigView.forEach { view in
            view.addRadus(radius: 7)
        }
        
        registerBtn.addRadus(radius: 7)
        iAgreeLab.custmeLable(text: "I agree for", ofSize: 13, color: .C454545_Black, typeStyle: .regular)
        
    }
}
    
