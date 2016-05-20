//
//  Extension.swift
//  SwiftTools
//
//  Created by xianchen on 16/4/25.
//  Copyright © 2016年 xianchen. All rights reserved.
//

import UIKit



var TapClickIndexKey:Int = 0
//MARK: 控件通用参数
extension UIView{

    typealias gestureView = ()->()
    var clickGesture:gestureView{
        set{
            
        }
        get{
            return self.clickGesture
        }
    }
    
    var  x:CGFloat{
        set{
            var rect = self.frame
            rect.origin.x = newValue
            self.frame = rect
        }
        get{
            return  self.frame.origin.x
        }
    }
    
   var  y:CGFloat{
        set{
            var rect = self.frame
            rect.origin.y = newValue
            self.frame = rect
        }
        get{
            return  self.frame.origin.y
        }
    }
    
    var width:CGFloat{
        set{
            var rect = self.frame
            rect.size.width = newValue
            self.frame = rect
        }
        get{
            return  self.frame.size.width
        }
    }
    
    var height:CGFloat{
        set{
            var rect = self.frame
            rect.size.height = newValue
            self.frame = rect
        }
        get{
            return  self.frame.size.height
        }
    }
    
    var centerX:CGFloat{
        set{
            var point = self.center
            point.x = newValue
            self.center = point
        }
        get{
            return self.center.x
        }
    }
    
    var centerY:CGFloat{
        set{
            var point = self.center
            point.y = newValue
            self.center = point
        }
        get{
            return self.center.y
        }
    }
    
    var right:CGFloat{
        return  self.x + self.width
    }
    
    var bottom:CGFloat{
        return  self.y + self.height
    }
    
    
}

//MARK: CGFloat方法扩展
extension CGFloat{
    var Width5s:CGFloat {
        return self * (UIScreen.mainScreen().bounds.width/320)
    }
    
    var Height5s:CGFloat {
        return self * (UIScreen.mainScreen().bounds.height/568)
    }
}

//MARK: Int方法扩展
extension Int{
    var Width5s:CGFloat {
        return CGFloat(self) * (UIScreen.mainScreen().bounds.width/320)
    }
    
    var Height5s:CGFloat {
        return CGFloat(self) * (UIScreen.mainScreen().bounds.height/568)
    }
}

//MARK: NSDate方法扩展
extension NSDate{
    var today:String{
        let dateFormat = NSDateFormatter()
        dateFormat.setLocalizedDateFormatFromTemplate("yyyy-M-d h:m:s")
        return dateFormat.stringFromDate(self)
    }
    
    func afterDay(after:Int) -> NSDate {
         return NSDate(timeIntervalSince1970:(self.timeIntervalSince1970 + 24*3600*Double(after)))
    }
    
    func forwardDay(forward:Int) -> NSDate {
        return NSDate(timeIntervalSince1970:(self.timeIntervalSince1970 - 24*3600*Double(forward)))
    }
}

//MARK: String方法扩展
extension String{
    
    func deleteOptionalString() -> String {
        let index1 = self.startIndex.advancedBy(9)
        let index2 = self.endIndex.advancedBy(-1)
        return self.substringWithRange(index1..<index2)
    }
    
    var UTF8String:String{
        return self.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
    }
}










