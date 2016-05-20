//
//  BaseTabbarController.swift
//  SwiftTools
//
//  Created by xianchen on 16/5/19.
//  Copyright © 2016年 xianchen. All rights reserved.
//

import UIKit

class BaseTabbarController: UITabBarController {
    
    lazy var titleArray:[String] = {
        return (NSArray() as! [String])
    }()
    
    lazy var normalImageArray:[String]  = {
        return (NSArray() as! [String])
    }()
    
    lazy var selectImageArray:[String]  = {
        return (NSArray() as! [String])
    }()
    
    lazy var viewcontrollerArray:[UIViewController] = {
        return (NSArray() as! [UIViewController])
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func loadVc() -> Void {
        for index:Int in 0..<titleArray.count {
            addTemp(viewcontrollerArray[index], title: titleArray[index], normalImageName: normalImageArray[index], selectImageName: selectImageArray[index])
        }
    }
    
    func addTemp(childVc:UIViewController, title:String, normalImageName:String, selectImageName:String) -> Void {
        childVc.title = title
        childVc.tabBarItem.image = UIImage(named: normalImageName)
        childVc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2)
        
        if MyDevice.SystemVersion() >= 7.0 && MyDevice.SystemVersion() < 9.0 {
            childVc.tabBarItem.selectedImage = UIImage(named: selectImageName )?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        }
        else{
            childVc.tabBarItem.selectedImage = UIImage(named: selectImageName )
        }
        
        let textAttrs = NSMutableDictionary()
        textAttrs.setObject(UIColor.lightGrayColor(), forKey: NSForegroundColorAttributeName)
        textAttrs.setObject(UIFont.systemFontOfSize(10), forKey: NSFontAttributeName)
        
        let selectTextAttrs = NSMutableDictionary()
        selectTextAttrs.setObject(UIColor.redColor(), forKey: NSForegroundColorAttributeName)
        selectTextAttrs.setObject(UIFont.systemFontOfSize(10), forKey: NSFontAttributeName)
        
        addChildViewController(childVc)
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
