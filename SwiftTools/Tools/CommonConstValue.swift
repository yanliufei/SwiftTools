//
//  CommonConstValue.swift
//  SwiftTools
//
//  Created by xianchen on 16/4/25.
//  Copyright © 2016年 xianchen. All rights reserved.
//

import UIKit

class ExProperty: NSObject {
    typealias gesture=()->Void
    var clickGesture:gesture?
    
}

 class MyDevice: NSObject {
    
    class func ScreenWidth() -> CGFloat {
        return UIScreen.mainScreen().bounds.width
    }
    
    class func ScreenHeight() -> CGFloat {
        return UIScreen.mainScreen().bounds.height
    }
    
    class func ScreenHeightCutNavigation() -> CGFloat {
        return self.ScreenHeight()-64
    }
    
    class func ScreenHeightCutNavigationAndTabbar() -> CGFloat {
        return self.ScreenHeight()-113
    }
    /*
    lazy var Width:CGFloat = UIScreen.mainScreen().bounds.width
    
    lazy var Height:CGFloat = UIScreen.mainScreen().bounds.height
    
    lazy var HeightCutNavigation:CGFloat = UIScreen.mainScreen().bounds.height - 64   //除去导航栏
    
    lazy var HeightCutNavigationAndTabbar:CGFloat = UIScreen.mainScreen().bounds.height - 113   //除去导航栏和tabbar
    */
    
    class func SystemVersion() -> Double {
        return Double(UIDevice.currentDevice().systemVersion)!
    }
}

//MARK:sqlite数据库操作语句快速生成
class SqliteSql: NSObject {
    //建立表格
    
    class func createTable(tableName:String, keys:[String], types:[AnyObject]) -> String{
        var temp = String()
        temp = "id integer primary key, "
        
        for  index:NSInteger in 0..<keys.count {
            var type:String?
            if types[index] is Int || types[index] is NSInteger {
                type = "integer"
            }
            else if types[index] is String || types[index] is NSString{
                type = "varchar" + "(\(types[index]))"
            }
            temp += keys[index] + " " + type!
            if index != keys.count-1 {
                temp += ", "
            }
        }
        
        return "create table " + tableName + "(\(temp))"
    }
    //插入一条或多条数据
     class func insertDataSql(tableName:String, data:NSDictionary) -> String {
        var keys = String()
        var values = String()
        for key in data.allKeys {
            keys += (key as! String)
            if key !== data.allKeys.last {
                keys += ","
            }
        }
        for index:Int in 0..<data.count {
            if data.allValues[index] is String || data.allValues[index] is NSString {
                values += "'\(data.allValues[index])'"
            }
            else if data.allValues[index] is Int || data.allValues[index] is NSInteger {
                values += "\(data.allValues[index])"
            }
            else if data.allValues[index] is NSNull{
                values += "NULL"
            }
            if index != data.count-1 {
                values += ", "
            }
        }
        
      return "insert into " + tableName + "(\(keys)) " + "values" + "(\(values))"
    }
    
    //返回tableName中所有数据
    class func selectAllData(tableName:String) -> String {
            return "select * from " + tableName
    }
    
    //按条件查找tableName中的数据0为与条件  1为或条件
    class func selectConditionData(tableName:String, conditons:NSDictionary, conditionType:NSInteger) -> String {
        var conditon = String()
        for index:NSInteger in 0..<conditons.count {
            let value = conditons.allValues[index]
            let key:String = conditons.allKeys[index] as! String
            if value is String || value is NSString {
                conditon += key + " = " + "'\(value)'" ;
            }
            else if value is Int || value is NSInteger{
                conditon += key + " = " + "\(value)" ;
            }
            else{
                continue
            }
            if value !== conditons.allValues.last {
                if conditionType == 0 {
                    conditon += " and "
                }
                else{
                    conditon += " or "
                }
            }
        }
        return "select * from " + tableName + " where \(conditon)"
    }
}



