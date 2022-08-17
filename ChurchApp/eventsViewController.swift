//
//  eventsViewController.swift
//  ChurchApp
//
//  Created by Heinrich Stoltz on 07/07/22.
//

import UIKit
import FSCalendar
import QVRWeekView

var currentDate = Date()
var datePicked = ""
class eventsViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, WeekViewDelegate {
    
    func didLongPressDayView(in weekView: WeekView, atDate date: Date) {
        //not now
    }
    
    func didTapEvent(in weekView: WeekView, withId eventId: String) {
        //not now
    }
    
    func eventLoadRequest(in weekView: WeekView, between startDate: Date, and endDate: Date) {
        //not now
    }
    
    @IBOutlet weak var calenderView: FSCalendar!
    @IBOutlet weak var eventViewCalender: WeekView!
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var stackMenuBtns: UIStackView!
    @IBOutlet weak var txtAddEvent: UITextField!
    @IBOutlet weak var eventDatePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       /* let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bgPicHome.png")
        self.view.insertSubview(backgroundImage, at: 0)
        */
        
        currentDate = Date()
        selectDate(date: currentDate)

        calenderView.scope = .month
        
        eventViewCalender.delegate = self
        calenderView.delegate = self
        calenderView.dataSource = self
        
        eventViewCalender.mainBackgroundColor = UIColor.white
        eventViewCalender.todayViewColor = UIColor.white
        eventViewCalender.visibleDaysInPortraitMode = 1
        eventViewCalender.defaultTopBarHeight = 0
        eventViewCalender.defaultDayViewColor = UIColor.white
        eventViewCalender.passedDayViewColor = UIColor.white
        eventViewCalender.weekendDayViewColor =  UIColor.white
        eventViewCalender.dayViewDashedSeparatorColor = UIColor.white
        eventViewCalender.sideBarWidth = 35
        // Do any additional setup after loading the view.
    
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        currentDate = date
        selectDate(date: currentDate)
    }
    
    func activeDayChanged(in weekView: WeekView, to date: Date) {
        currentDate = date
        calenderView.select(date)
    }
    
    func selectDate(date: Date){
        calenderView.select(date)
        eventViewCalender.showDay(withDate: date)
    }
    
    var newEvent = String()
    @IBAction func btnAddEvent(_ sender: Any) {
        if txtAddEvent.hasText{
            //newEvent = txtAddEvent.text!
           
        }
        else{
            txtAddEvent.text = "Please insert event."
        }
            
           
    }
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
       
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
