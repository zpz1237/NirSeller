//
//  OrderFoodTableViewCell.swift
//  NirSeller
//
//  Created by Nirvana on 9/9/15.
//  Copyright © 2015 NSNirvana. All rights reserved.
//

import UIKit

class OrderFoodTableViewCell: UITableViewCell {
    
    @IBOutlet weak var symbolView: UIView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodNumber: UILabel!
    @IBOutlet weak var foodPrice: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
