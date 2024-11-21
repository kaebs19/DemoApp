//
//  Helper.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 20/11/2024.
//

import Foundation
import UIKit


public var screenWidth: CGFloat { get { return UIScreen.main.bounds.size.width } }
public var screenHeight:CGFloat { get { return UIScreen.main.bounds.size.height } }
public var iPhoneXFactor: CGFloat { get {return ((screenWidth * 1.00) / 360)} }
