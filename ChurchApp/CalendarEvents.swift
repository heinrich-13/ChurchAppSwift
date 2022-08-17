//
//  CalendarEvents.swift
//  ChurchApp
//
//  Created by Heinrich Stoltz on 11/07/22.
//

import UIKit

var selectedDate = Date()

class CalendarEvents: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var lblDisplayMonth: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var totalSquares = [String]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setCellsView()
        setMonthView()
        
    }
    func setCellsView()
    {
        let width = (collectionView.frame.size.width - 2) / 8
        let hight = (collectionView.frame.size.height - 2) / 8
        
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: width, height: hight)
        
    }
    func setMonthView()
    {
        totalSquares.removeAll()
        let daysInMonth = CalendarHelper().daysInMonth(date: selectedDate)
        let firstDayOfMonth = CalendarHelper().firstOfMonth(date: selectedDate)
        let startingSpaces = CalendarHelper().weekday(date: firstDayOfMonth)
        
        var count: Int = 1
        
        while(count <= 42)
        {
            if(count <= startingSpaces || count - startingSpaces > daysInMonth)
            {
                totalSquares.append("")
            }
            else
            {
                totalSquares.append(String(count - startingSpaces))
            }
            count += 1
        }
        lblDisplayMonth.text = CalendarHelper().monthString(date: selectedDate) + " " + CalendarHelper().yearString(date: selectedDate)
        collectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalSquares.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "heinCell", for: indexPath) as! CalendarCell
        cell.lblDayOfMonth.text = totalSquares[indexPath.item]
        /*
        let date = totalSquares[indexPath.item]
        if(date == selectedDate)
        {
            cell.backgroundColor = UIColor.systemGreen
        }
        else
        {
            cell.backgroundColor = UIColor.white
        }
         */
        return cell
    }
    
    @IBAction func btnPrevMonth(_ sender: Any) {
        selectedDate = CalendarHelper().minusMonth(date: selectedDate)
        setMonthView()
    }
    
    @IBAction func btnNextMonth(_ sender: Any) {
        selectedDate = CalendarHelper().plusMonth(date: selectedDate)
        setMonthView()
    }
    
    override open var shouldAutorotate: Bool
    {
        return false
    }
}
