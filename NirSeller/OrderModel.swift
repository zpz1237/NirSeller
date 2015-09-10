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
    init(symbolViewColor: UIColor, foodName: String, foodNumber: String, foodPrice: String) {
        self.symbolViewColor = symbolViewColor
        self.foodName = foodName
        self.foodNumber = foodNumber
        self.foodPrice = foodPrice
    }
}

struct InfoModel: OrderModel {
    var orderNumber: String
    var orderTime: String
    var phoneNumber: String
    var delayTime: String
    init(orderNumber: String, orderTime: String, phoneNumber: String, delayTime: String) {
        self.orderNumber = orderNumber
        self.orderTime = orderTime
        self.phoneNumber = phoneNumber
        self.delayTime = delayTime
    }
}

