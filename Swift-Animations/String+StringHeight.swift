//
//  String+StringHeight.swift
//  StringHeight
//
//  Created by YouXianMing on 16/8/30.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

extension String {
    
    /**
     Get the height with the string.
     
     - parameter attributes: The string attributes.
     - parameter fixedWidth: The fixed width.
     
     - returns: The height.
     */
    func heightWithStringAttributes(_ attributes : [String : AnyObject], fixedWidth : CGFloat) -> CGFloat {
        
        guard self.characters.count > 0 && fixedWidth > 0 else {
        
            return 0
        }
        
        let size = CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude)
        let text = self as NSString
        let rect = text.boundingRect(with: size, options:.usesLineFragmentOrigin, attributes: attributes, context:nil)
        
        return rect.size.height
    }
    
    /**
     Get the height with font.
     
     - parameter font:       The font.
     - parameter fixedWidth: The fixed width.
     
     - returns: The height.
     */
    func heightWithFont(_ font : UIFont = UIFont.systemFont(ofSize: 18), fixedWidth : CGFloat) -> CGFloat {
        
        guard self.characters.count > 0 && fixedWidth > 0 else {
            
            return 0
        }
        
        let size = CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude)
        let text = self as NSString
        let rect = text.boundingRect(with: size, options:.usesLineFragmentOrigin, attributes: [NSFontAttributeName : font], context:nil)
        
        return rect.size.height
    }
    
    /**
     Get the height with font.
     
     - parameter font:       The font.
     - parameter fixedWidth: The fixed width.
     
     - returns: The height.
     */
    static func HeightWithFont(_ font : UIFont = UIFont.systemFont(ofSize: 18)) -> CGFloat {
        
        let string = "One"
        let size   = CGSize(width: 200, height: CGFloat.greatestFiniteMagnitude)
        let text   = string as NSString
        let rect   = text.boundingRect(with: size, options:.usesLineFragmentOrigin, attributes: [NSFontAttributeName : font], context:nil)
        
        return rect.size.height
    }
    
    /**
     Get the width with the string.
     
     - parameter attributes: The string attributes.
     
     - returns: The width.
     */
    func widthWithStringAttributes(_ attributes : [String : AnyObject]) -> CGFloat {
        
        guard self.characters.count > 0 else {
            
            return 0
        }
        
        let size = CGSize(width: CGFloat.greatestFiniteMagnitude, height: 0)
        let text = self as NSString
        let rect = text.boundingRect(with: size, options:.usesLineFragmentOrigin, attributes: attributes, context:nil)
        
        return rect.size.width
    }
    
    /**
     Get the width with the string.
     
     - parameter font: The font.
     
     - returns: The string's width.
     */
    func widthWithFont(_ font : UIFont = UIFont.systemFont(ofSize: 18)) -> CGFloat {
        
        guard self.characters.count > 0 else {
            
            return 0
        }
        
        let size = CGSize(width: CGFloat.greatestFiniteMagnitude, height: 0)
        let text = self as NSString
        let rect = text.boundingRect(with: size, options:.usesLineFragmentOrigin, attributes: [NSFontAttributeName : font], context:nil)
        
        return rect.size.width
    }
}



