//
//  MonthCollectionViewCell.swift
//  timeLine
//
//  Created by Alex on 6/15/18.
//  Copyright © 2018 SweatNet. All rights reserved.
//

import UIKit

class MonthCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    var year: Int?
    var month: Int?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        for each_view in stackView.subviews {
            each_view.backgroundColor = UIColor.clear
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for _ in 0...30 {
            let tick = UIView()
            let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
            tick.addGestureRecognizer(tap)
            self.stackView?.addArrangedSubview(tick)
        }
    }
    
    func colorViews(monthDates: [Date]){
        for date in monthDates {
            let dayIndex = Calendar.current.component(.day, from: date)
            let tick = stackView.arrangedSubviews[dayIndex]
            tick.backgroundColor = UIColor.red
        }
    }
    
    @objc func handleTap(_ gesture: UIGestureRecognizer){
        if let tick = gesture.view {
            if tick.superview == self.stackView {
                if let idx = self.stackView.arrangedSubviews.index(of: tick) {
                    print("monthd", self.month!,"day",idx,"year", self.year!)
                }
            }
        }
    }
}

