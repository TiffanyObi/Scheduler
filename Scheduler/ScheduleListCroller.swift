//
//  ViewController.swift
//  Scheduler
//
//  Created by Tiffany Obi on 11/20/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit

class ScheduleListCroller: UIViewController {

    @IBOutlet weak  var tableView: UITableView!
    var events = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
    }

    @IBAction func addNewEvent(segue: UIStoryboardSegue){
        //caveman debuggin
        print("adding event...")
        
        //get a reference to the createEvent Controller instance.
        
        guard let createEventController = segue.source as? CreateEventController,
            
            let createdEvent = createEventController.event
            else {
            fatalError("failed to access CreateEventConroller")
        }
        // insent event into our events array. implies that it goes to the top of events array.
        events.insert(createdEvent, at: 0)
        
        //create an indexPath to be inserted into the table view
        //will represent the top of the table view
        let indexPath = IndexPath(row: 0, section: 0)
        
        //use indexPATH to insert into TABLEVIEW.
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    
}

extension ScheduleListCroller: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
        let event = events[indexPath.row]
        cell.textLabel?.text = event.name
        cell.detailTextLabel?.text = event.date.description
        return cell
    }
   
    //MARK:- deleting rows in a tableview
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .insert:
            print("now inserting")
        case .delete:
            events.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            print("now deleting")
        default:
            print("......")
        }
        
    }
    
}
