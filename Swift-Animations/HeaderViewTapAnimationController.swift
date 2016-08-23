//
//  HeaderViewTapAnimationController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/9.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class HeaderViewTapAnimationController: NormalTitleViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var classes           : [ClassModel] = [ClassModel]()
    private var sectionFirstLoad  : Bool         = false
    
    private var      tableView    : UITableView!
    private weak var tmpHeadView  : ClassHeaderView?
    
    override func setup() {
        
        super.setup()
        
        // TableView.
        tableView                     = UITableView(frame: (contentView?.bounds)!)
        tableView.dataSource          = self
        tableView.delegate            = self
        tableView.rowHeight           = 60
        tableView.sectionHeaderHeight = 30
        tableView.separatorStyle      = .None
        contentView?.addSubview(tableView!)
        
        // Register.
        ClassHeaderView.RegisterTo(tableView)
        StudentInfoCell.RegisterTo(tableView)
        
        // Data source.
        let Aitna    = ClassModel(className: "Aitna")
        Aitna.expend = false
        Aitna.students.append(StudentModel(name: "Y.X.M.",  age: 27))
        Aitna.students.append(StudentModel(name: "Leif",    age: 12))
        Aitna.students.append(StudentModel(name: "Lennon",  age: 23))
        Aitna.students.append(StudentModel(name: "Jerome",  age: 19))
        Aitna.students.append(StudentModel(name: "Isidore", age: 15))
        
        let Melete    = ClassModel(className: "Melete")
        Melete.expend = false
        Melete.students.append(StudentModel(name: "Merle",  age: 17))
        Melete.students.append(StudentModel(name: "Paddy",  age: 31))
        Melete.students.append(StudentModel(name: "Perry",  age: 59))
        Melete.students.append(StudentModel(name: "Philip", age: 23))
        
        let Aoede    = ClassModel(className: "Aoede")
        Aoede.expend = false
        Aoede.students.append(StudentModel(name: "Verne",   age: 12))
        Aoede.students.append(StudentModel(name: "Vincent", age: 89))
        Aoede.students.append(StudentModel(name: "Walter",  age: 43))
        Aoede.students.append(StudentModel(name: "Zachary", age: 21))

        let Dione    = ClassModel(className: "Dione")
        Dione.expend = false
        Dione.students.append(StudentModel(name: "Timothy",  age: 72))
        Dione.students.append(StudentModel(name: "Roderick", age: 34))
        Dione.students.append(StudentModel(name: "Quentin",  age: 12))
        Dione.students.append(StudentModel(name: "Paddy",    age: 75))
        
        let Adanos    = ClassModel(className: "Adanos")
        Adanos.expend = false
        Adanos.students.append(StudentModel(name: "Mortimer", age: 43))
        Adanos.students.append(StudentModel(name: "Michael",  age: 64))
        Adanos.students.append(StudentModel(name: "Kevin",    age: 23))
        Adanos.students.append(StudentModel(name: "Jeremy",   age: 21))
        
        classes.append(Aitna)
        classes.append(Melete)
        classes.append(Aoede)
        classes.append(Dione)
        classes.append(Adanos)
        
        // Expend animations.
        GCDQueue.executeInMainQueue({ 
            
            self.sectionFirstLoad = true
            self.tableView.insertSections(NSIndexSet(indexesInRange: NSMakeRange(0, self.classes.count)), withRowAnimation: .Fade)
            
            GCDQueue.executeInMainQueue({
                
                if let headView = self.tmpHeadView {
                
                    headView.buttonEvent()
                }
                
                }, afterDelaySeconds: 0.4)
            }, afterDelaySeconds: 0.3)
    }
    
    // MARK: UITableView's delegate & dataSource.
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let classModel = classes[section]
        if classModel.expend == true {
            
            return classModel.students.count
            
        } else {
        
            return 0
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        if sectionFirstLoad == false {
            
            return 0
            
        } else {
        
            return classes.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let classModel       = classes[indexPath.section]
        let customCell       = tableView.dequeueReusableCellWithIdentifier("StudentInfoCell") as! CustomCell
        customCell.data      = classModel.students[indexPath.row]
        customCell.indexPath = indexPath
        customCell.loadContent()
        
        return customCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.selectedEventWithIndexPath(indexPath)
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView       = tableView.dequeueReusableHeaderFooterViewWithIdentifier("ClassHeaderView") as! ClassHeaderView
        headerView.section   = section
        headerView.data      = classes[section]
        headerView.tableView = tableView
        headerView.loadContent()
        
        if tmpHeadView == nil && section == 0 {
            
            tmpHeadView = headerView
        }
        
        return headerView
    }
}

