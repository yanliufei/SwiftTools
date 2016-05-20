//
//  BaseModel.swift
//  SwiftTools
//
//  Created by xianchen on 16/5/18.
//  Copyright © 2016年 xianchen. All rights reserved.
//

import UIKit

class BaseModel: NSObject {
    
   class func GetModelWithJsonDict(jsonDict:NSDictionary) -> AnyObject {
        var count:UInt32 = 0
        let properties = class_copyPropertyList(BaseModel.self, &count)
        for index:UInt32 in 0..<count {
            var property = properties[Int(index)]
            let key:String = String(CString: property_getName(property), encoding: NSUTF8StringEncoding)!
            property = jsonDict.objectForKey(key) as! objc_property_t
        }
        return self
    }
    
}
