//
//  menuModel.swift
//  NirSeller
//
//  Created by Nirvana on 9/10/15.
//  Copyright © 2015 NSNirvana. All rights reserved.
//

import Foundation

struct MenuModel {
    var menuImage: UIImage
    var menuName: String
    var menuPrice: String
    var menuDescribe: String
    init(menuImage: UIImage, menuName: String, menuPrice: String, menuDescribe: String) {
        self.menuImage = menuImage
        self.menuName = menuName
        self.menuPrice = menuPrice
        self.menuDescribe = menuDescribe
    }
}