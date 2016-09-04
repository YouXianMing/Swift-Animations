//
//  CountDownTimerController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/9/4.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class CountDownTimerController: NormalTitleViewController, UITableViewDelegate, UITableViewDataSource {

    var timesArray : [CellDataAdapter]!
    var tableView  : UITableView!
    var timer      : GCDTimer = GCDTimer(inQueue: GCDQueue.mainQueue)
    
    override func setup() {
        
        super.setup()
        
        // Create data source.
        timesArray = [CellDataAdapter]()
        
        func add(title title : String, countdownTime : Int) {
        
            timesArray.append(CountDownTimeCell.Adapter(data: TimeModel(title: title, countdownTime: countdownTime)))
        }
        
        add(title: "YouXianMing", countdownTime: 20034)
        add(title: "Aaron",       countdownTime: 31)
        add(title: "Nicholas",    countdownTime: 1003)
        add(title: "Quentin",     countdownTime: 394)
        add(title: "Samirah",     countdownTime: 345345)
        add(title: "Serafina",    countdownTime: 233)
        add(title: "Shanon",      countdownTime: 4649)
        add(title: "Sophie",      countdownTime: 3454)
        add(title: "Steven",      countdownTime: 54524)
        add(title: "Saadiya",     countdownTime: 235)
        
        // Create TableView.
        tableView                = UITableView(frame: (contentView?.bounds)!)
        tableView.delegate       = self
        tableView.dataSource     = self
        tableView.separatorStyle = .None
        tableView.rowHeight      = 60
        contentView?.addSubview(tableView)

        // Register cell.
        CountDownTimeCell.RegisterTo(tableView)

        // Timer event.
        weak var wself = self
        timer.event({ 
            
            for (_, dataAdapter) in wself!.timesArray.enumerate() {
                
                if let model = dataAdapter.data as? TimeModel {
                
                    model.countDown()
                }
            }
            
            DefaultNotificationCenter.PostMessageTo(NotificationEvent.CountDownTimeCellCountDown.Message())
        
            }, timeIntervalWithSeconds: 1.0)
        timer.start()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return timesArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        return tableView.dequeueCellAndLoadContentFromAdapter(timesArray[indexPath.row], indexPath: indexPath)
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        (cell as! CustomCell).display = true
    }
    
    func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        (cell as! CustomCell).display = false
    }
}


