//
//  MonthCollectionViewCell.swift
//  timeLine
//
//  Created by Alex on 6/15/18.
//  Copyright © 2018 SweatNet. All rights reserved.
//

import UIKit

class MonthCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var stackView: UIStackView!
    var dayViews: [Int:UIView] = [:]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in 1...30 {
            let tick = UIView()
            dayViews[i] = tick
            self.stackView?.addArrangedSubview(tick)
        }
    }

}
