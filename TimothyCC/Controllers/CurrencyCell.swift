//
//  CurrencyCell.swift
//  TimothyCC
//
//  Created by Timothy on 19/8/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import UIKit

class CurrencyCell: UITableViewCell {
    
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    func prepare(name: String?, value: String?, currencyName: String?) {
        leftLabel.text = name
        rightLabel.text = value
        nameLabel.text = currencyName
    }
    
}
