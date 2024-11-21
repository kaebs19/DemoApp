//
//  LoginVC.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 30/10/2024.
//

import UIKit

class LoginVC: UIViewController {
    
    // -- outlets
    @IBOutlet  var bigView: [UIView]!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    @IBOutlet weak var guestBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()

    }

    @IBAction func loginBtnTapped(_ sender: Any) {
        navigateToController(identifier: .TAB_BARS, storyboardName: .TabBar)
        print("Did tap login button")
    }

    @IBAction func registerBtnTapped(_ sender: Any) {
        
        navigateToController(identifier: .REGISTER_VC, storyboardName: .Main)
    }
    
}


extension LoginVC {
    
    func initUI() {
        bigView.forEach {$0.layer.cornerRadius = 7}
        
        forgotPasswordBtn.custmerButton(text: "Forget Password?", bigColor: .CFFFFFF_whith, color: .C454545_Black, typeStyle: .semibold, ofSize: 14)
        [loginBtn].forEach { button in
            button?.custmerButton(text: "Login", bigColor: .C0079FB_blue, color: .CFFFFFF_whith, typeStyle: .semibold, ofSize: 14)
            button?.layer.cornerRadius = 7
        }
        [registerBtn].forEach { button in
            button?.custmerButton(text: "Register", bigColor: .CFFFFFF_whith, color: .C0079FB_blue, typeStyle: .semibold, ofSize: 14)
            button?.addRadusWithBoder(text: "", raduis: 7, bordercolor: .C0079FB_blue, Width: 1)
            
        }
    }
}
