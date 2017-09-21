//
//  SystemFontInfoController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 2017/9/15.
//  Copyright © 2017年 YouXianMing. All rights reserved.
//

import UIKit

class SystemFontInfoController: NormalTitleViewController, UITableViewDelegate, UITableViewDataSource, CustomCellDelegate, CustomHeaderFooterViewDelegate {

    fileprivate var fontFamilyArray : [FontFamilyModel] = []
    fileprivate var tableView       : UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        getFonts()
        
        tableView                     = UITableView.init(frame: (contentView?.bounds)!, style: .plain)
        tableView.delegate            = self
        tableView.dataSource          = self
        tableView.separatorStyle      = .none
        tableView.rowHeight           = FontCell.HeightWithData()
        tableView.sectionHeaderHeight = FontFamilyHeaderView.HeightWithData()
        contentView!.addSubview(tableView)
        
        //  if #available(iOS 11.0, *) {
        //
        //      tableView.contentInsetAdjustmentBehavior = .never
        // }
        
        FontCell.RegisterTo(tableView)
        FontFamilyHeaderView.RegisterTo(tableView)
    }
    
    // MARK: private
    
    private func getFonts() {
        
        for (familyName , fontNames) in FontInfomation.Shared.fontsDictionary() {
            
            let fontFamilyModel = FontFamilyModel.init(familyName: familyName)
            
            for fontName in fontNames {
                
                fontFamilyModel.fonts.append(FontModel.init(fontName: fontName))
            }
            
            fontFamilyArray.append(fontFamilyModel)
        }
    }
    
    // MARK: UITableViewDelegate, UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell      = tableView.dequeueReusableCell(withIdentifier: "FontCell") as! CustomCell
        cell.data     = fontFamilyArray[indexPath.section].fonts[indexPath.row]
        cell.delegate = self
        cell.loadContent()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fontFamilyArray[section].fonts.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return fontFamilyArray.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView      = tableView.dequeueReusableHeaderFooterView(withIdentifier: "FontFamilyHeaderView") as! CustomHeaderFooterView
        headerView.data     = fontFamilyArray[section]
        headerView.delegate = self
        headerView.loadContent()
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.selectedEventWithIndexPath(indexPath)
    }
    
    // MARK: CustomCellDelegate
    
    func customCell(_ cell: CustomCell?, event: Any?) {
        
        if event is FontModel {
            
            print((event as! FontModel).fontName!)
        }
    }
    
    // MARK: CustomHeaderFooterViewDelegate
    
    func customHeaderFooterView(_ headerFooterView: CustomHeaderFooterView?, event: AnyObject?) {
        
        if event is FontFamilyModel {
            
            print((event as! FontFamilyModel).familyName!)
        }
    }
}

class FontInfomation : NSObject {
    
    // MARK: private
    
    private var infos : [String : Array<String>]
    
    private override init() {
        
        infos = [String : Array<String>]()
        for familyName in UIFont.familyNames {
            
            infos[familyName] = UIFont.fontNames(forFamilyName: familyName)
        }
    }
    
    // MARK: public
    
    static let Shared = FontInfomation()
    
    func fontsDictionary() -> [String : Array<String>] {
        
        return FontInfomation.Shared.infos
    }
}
