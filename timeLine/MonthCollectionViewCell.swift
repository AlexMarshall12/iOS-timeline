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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for _ in 1...30 {
            let tick = UIView()
            self.stackView?.addArrangedSubview(tick)
        }
    }
    
    func colorViews(monthDates: [Date]){
        for date in monthDates {
            let dayIndex = Calendar.current.component(.day, from: date)
            let tick = stackView.arrangedSubviews[dayIndex - 1]
            tick.backgroundColor = UIColor.red
        }
    }

}
