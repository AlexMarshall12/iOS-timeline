//
//  ViewController.swift
//  timeLine
//
//  Created by Alex on 6/15/18.
//  Copyright © 2018 SweatNet. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dates = [Date?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "MonthCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MonthCollectionViewCell")
        let allDates = Helper.generateRandomDate(daysBack: 900, numberOf: 3)
        self.dates = allDates.sorted(by: {
            $0!.compare($1!) == .orderedAscending
        })
        for date in self.dates{
            print("months",date)
        }
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let first = (dates.first)!
        let last = (dates.last)!
        let months = last?.months(from: first!) ?? 0
        if let diff = last?.months(from: first!), diff <= 5 {
            return months + 5-diff
        } else {
            print("months",months+1)
            return months + 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MonthCollectionViewCell", for: indexPath) as! MonthCollectionViewCell
        cell.backgroundColor = UIColor.gray
        let firstDate = dates.first
        let index = indexPath.item
        let monthDate = Calendar.current.date(byAdding: .month, value: index, to: firstDate as! Date)
        let monthInt = Calendar.current.component(.month, from: monthDate!)
        let yearInt = Calendar.current.component(.year, from: monthDate!)
        cell.monthLabel.text = String(monthInt)+" "+String(yearInt)
        cell.year = yearInt
        cell.month = monthInt
        let monthDates = dates(self.dates as! [Date], withinMonth: monthInt, withinYear: yearInt)
        cell.colorViews(monthDates:monthDates)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width/5, height: collectionView.bounds.size.height)
    }
    
    func dates(_ dates: [Date], withinMonth month: Int, withinYear year: Int) -> [Date] {
        let calendar = Calendar.current
        let components: Set<Calendar.Component> = [.month,.year]
        let filtered = dates.filter { (date) -> Bool in
            let monthAndYear = calendar.dateComponents(components, from: date)
            return (monthAndYear.month == month && monthAndYear.year == year)
        }
        return filtered
    }
}

