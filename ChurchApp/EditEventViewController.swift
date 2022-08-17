//
//  EditEventViewController.swift
//  ChurchApp
//
//  Created by Heinrich Stoltz on 12/07/22.
//

import Foundation
import UIKit

class EditEventViewController: UIViewController{
    @IBOutlet weak var txtInputEvent: UITextField!
    @IBOutlet weak var datePickerEvent: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePickerEvent.date = selectedDate 
    }
    
    @IBAction func btnSaveEvent(_ sender: Any) {
        let newEvent = Event()
        newEvent.id = eventsList.count
        newEvent.name = txtInputEvent.text
        newEvent.date = datePickerEvent.date
        eventsList.append(newEvent)
        navigationController?.popViewController(animated:  true)
    }
    
}
