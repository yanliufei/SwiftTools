//
//  MainTabbarController.swift
//  SwiftTools
//
//  Created by xianchen on 16/5/13.
//  Copyright © 2016年 xianchen. All rights reserved.
//

import UIKit

class MainTabbarController: UITabBarController {

    lazy var tabbarTitles:NSArray = {
        return ["首页", "资讯", "活动", "我的"]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let widht:CGFloat = 5.0
        
        let mywidth = UIScreen.mainScreen().bounds.width.Width5s
        print(mywidth)
        for  tempTitle in tabbarTitles {
            addTemp(UIViewController(), title: tempTitle as! String, image: UIImage(), selectImage: UIImage())
        }
        let dict:NSMutableDictionary = ["A":NSNull(), "B":101, "C":"102", "D":"103"]
        print(dict)
//        print(SqliteSql.createTable("mytable", keys: dict.allKeys as! [String], types: dict.allValues))
        print(SqliteSql.insertDataSql("mytable", data:dict))
        print(SqliteSql.selectConditionData("mytable", conditons:dict, conditionType:1))
        // Do any additional setup after loading the view.
    }
    
    func addTemp(childVc:UIViewController, title:String, image:UIImage, selectImage:UIImage) -> Void {
        print(title)
        childVc.title = title
        childVc.tabBarItem.image = image
        childVc.tabBarItem.selectedImage = selectImage
        
        let selectTextAttrs:NSDictionary = [NSForegroundColorAttributeName:UIColor.redColor(), NSFontAttributeName:UIFont.systemFontOfSize(12)]
//        selectTextAttrs.setObject(UIColor.redColor(), forUndefinedKey: NSForegroundColorAttributeName)
//        selectTextAttrs.setObject(UIFont.systemFontOfSize(10), forUndefinedKey: NSFontAttributeName)
        
        let textAttrs:NSDictionary = [NSForegroundColorAttributeName:UIColor.grayColor(), NSFontAttributeName:UIFont.systemFontOfSize(12)]
//        textAttrs.setObject(UIColor.lightGrayColor(), forKey: NSForegroundColorAttributeName)
//        textAttrs.setObject(UIFont.systemFontOfSize(10), forKey: NSFontAttributeName)
        
        childVc.tabBarItem.setTitleTextAttributes(textAttrs as? [String:AnyObject], forState: UIControlState.Normal)
        childVc.tabBarItem.setTitleTextAttributes(selectTextAttrs as? [String: AnyObject], forState: UIControlState.Selected)
        
        self.addChildViewController(UINavigationController(rootViewController: childVc))
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MainTabbarController{
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        print("click")
    }
}
