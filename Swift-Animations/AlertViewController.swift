//
//  AlertViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 2017/9/13.
//  Copyright © 2017年 YouXianMing. All rights reserved.
//

import UIKit

class AlertViewController: NormalTitleViewController, UICollectionViewDelegate, UICollectionViewDataSource, CustomCollectionViewCellDelegate, BaseMessageViewDelegate {
    
    fileprivate var collectionView : UICollectionView!
    fileprivate var layout         : UICollectionViewFlowLayout!
    fileprivate var adapters       : [CellDataAdapter] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Layout.
        layout                          = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing      = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize                = CGSize.init(width: Screen.Width / 2, height: Screen.Width / 2)
        
        // CollectionView.
        collectionView                  = UICollectionView.init(frame: (contentView?.bounds)!, collectionViewLayout: layout!)
        collectionView.backgroundColor = UIColor.clear
        collectionView.delegate        = self
        collectionView.dataSource      = self
        contentView?.addSubview(collectionView!)
        AlertViewCollectionViewCell.RegisterTo(collectionView!)
        
        if #available(iOS 11.0, *) {
            
            collectionView?.contentInsetAdjustmentBehavior = .never
        }
        
        // Adapters.
        adapters.append(AlertViewCollectionViewCell.Adapter(data: "MessageView" as AnyObject))
        adapters.append(AlertViewCollectionViewCell.Adapter(data: "AlertView" as AnyObject))
    }
    
    // MARK: UICollectionViewDelegate, UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return adapters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return collectionView.dequeueCellAndLoadContentFromAdapter(adapters[indexPath.row], indexPath: indexPath, delegate: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.selectedEventWithIndexPath(indexPath)
    }
    
    // MARK: CustomCollectionViewCellDelegate
    
    func customCollectionViewCell(_ cell: CustomCollectionViewCell?, event: Any?) {
        
        if event is String {
            
            let name = event as! String
            
            if name == "MessageView" {
                
                MessageView.Setup(messageObject : "If you find this post helpful, please recommend it for others to read." as AnyObject,
                                  contentView   : UIWindow.getKeyWindow(),
                                  delegate      : self).show()
                
            } else if name == "AlertView" {
                
                let messageObject = AlertViewMessageObject.init(title             : "警告",
                                                                content           : "不要轻信陌生电话,短信;不要轻易点击信息中的链接;不要按陌生电话,短信要求转账汇款;不要安装不了解的软件.",
                                                                buttonTitles      : ["关闭", "更多信息"],
                                                                buttonTitlesState : [AlertViewButtonType.Black, AlertViewButtonType.Red])
                
                AlertView.Setup(messageObject : messageObject as AnyObject,
                                contentView   : UIWindow.getKeyWindow(),
                                delegate      : self,
                                autoHiden     : false).show()
            }
        }
    }
    
    // MARK: BaseMessageViewDelegate
    
    func baseMessageView(_ messageView : BaseMessageView, event : AnyObject?) {
        
        if messageView.isKind(of: AlertView.classForCoder()) {
            
            print(event ?? "None")
        }
    }
    
    func baseMessageViewWillAppear(_ messageView : BaseMessageView) {
        
        print("baseMessageViewWillAppear")
    }
    
    func baseMessageViewDidAppear(_ messageView : BaseMessageView) {
        
        print("baseMessageViewDidAppear")
    }
    
    func baseMessageViewWillDisappear(_ messageView : BaseMessageView) {
        
        print("baseMessageViewWillDisappear")
    }
    
    func baseMessageViewDidDisappear(_ messageView : BaseMessageView) {
        
        print("baseMessageViewDidDisappear")
    }
}
