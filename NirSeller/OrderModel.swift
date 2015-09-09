//
//  OrderModel.swift
//  NirSeller
//
//  Created by Nirvana on 9/9/15.
//  Copyright © 2015 NSNirvana. All rights reserved.
//

import Foundation

protocol OrderModel {
    
}

struct FoodModel: OrderModel {
    var symbolViewColor: UIColor
    var foodName: String
    var foodNumber: String
    var foodPrice: String
}

struct InfoModel: OrderModel {
    var orderNumber: String
    var orderTime: String
    var phoneNumber: String
    var delayTime: String
}

