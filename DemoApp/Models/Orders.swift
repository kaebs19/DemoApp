//
//  Orders.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 15/11/2024.
//

import Foundation


struct Orders {
    
    var orderData: String
    var orderNumber: String
    var orderPrice: String
    var orderState: State
}

enum State: String {
    case Delivered = "Delivered"
    case Pending = "Pending"
    case Cancelled = "Cancelled"
    case Processing = "Processing"
}
