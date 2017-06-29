//
//  CountDownTimerController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/9/4.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class CountDownTimerController: NormalTitleViewController, UITableViewDelegate, UITableViewDataSource {

    fileprivate var timesArray : [CellDataAdapter]!
    fileprivate var tableView  : UITableView!
    fileprivate var timer      : Timer!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Create data source.
        timesArray = [CellDataAdapter]()
        
        func add(title : String, countdownTime : Int) {
        
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
        tableView.separatorStyle = .none
        tableView.rowHeight      = 60
        contentView?.addSubview(tableView)

        // Register cell.
        CountDownTimeCell.RegisterTo(tableView)

        // Init timer.
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(CountDownTimerController.timerEvent), userInfo: nil, repeats: true)
    }
    
    func timerEvent() {
        
        for (_, dataAdapter) in timesArray.enumerated() {
            
            if let model = dataAdapter.data as? TimeModel {
                
                model.countDown()
            }
        }
        
        DefaultNotificationCenter.PostMessageTo(NotificationEvent.countDownTimeCellCountDown.Message())
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return timesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return tableView.dequeueCellAndLoadContentFromAdapter(timesArray[(indexPath as NSIndexPath).row], indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        (cell as! CustomCell).display = true
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        (cell as! CustomCell).display = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        timer.invalidate()
    }
}


