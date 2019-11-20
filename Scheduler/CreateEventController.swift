//
//  CreateEventController.swift
//  Scheduler
//
//  Created by Tiffany Obi on 11/20/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit

class CreateEventController: UIViewController {
    
    @IBOutlet weak var createEventTextFeild: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createEventTextFeild.delegate = self
// set view controller as the delegate for the textfeild
        // instantiate a default value for event
        event = Event(date: Date(), name: "SwiftRocks")
    }
    
    @IBAction func datePickerChanged(sender: UIDatePicker){
        //update date of event
        event?.date = sender.date
    }
    
}

extension CreateEventController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      
        //dismiss keyboard
        textField.resignFirstResponder()
        
        //update name of event
        event?.name = textField.text ?? "no name"
        
        return true
    }
}
