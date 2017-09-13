//
//  AlertViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 2017/9/13.
//  Copyright © 2017年 YouXianMing. All rights reserved.
//

import UIKit

class AlertViewController: NormalTitleViewController, UICollectionViewDelegate, UICollectionViewDataSource, CustomCollectionViewCellDelegate, BaseMessageViewDelegate {

    private var collectionView : UICollectionView?
    private var layout         : UICollectionViewFlowLayout?
    private var adapters       : [CellDataAdapter] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Layout.
        layout                          = UICollectionViewFlowLayout.init()
        layout?.minimumLineSpacing      = 0
        layout?.minimumInteritemSpacing = 0
        layout?.itemSize                = CGSize.init(width: Width() / 2, height: Width() / 2)
        
        // CollectionView.
        collectionView                  = UICollectionView.init(frame: (contentView?.bounds)!, collectionViewLayout: layout!)
        collectionView?.backgroundColor = UIColor.clear
        collectionView?.delegate        = self
        collectionView?.dataSource      = self
        contentView?.addSubview(collectionView!)
        AlertViewCollectionViewCell.RegisterTo(collectionView!)
        
        // Adapters.
        adapters.append(AlertViewCollectionViewCell.Adapter(data: "MessageView" as AnyObject))
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
    
    func customCollectionViewCell(_ cell: CustomCollectionViewCell?, event: AnyObject?) {
        
        if (event as? String == "MessageView") {
         
            MessageView.init().setup(messageObject : "If you find this post helpful, please recommend it for others to read." as AnyObject,
                                     contentView: UIWindow.getKeyWindow(),
                                     delegate : self).show()
        }
    }
    
    // MARK: BaseMessageViewDelegate
    
    func baseMessageView(_ messageView : BaseMessageView, event : AnyObject?) {
        
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
