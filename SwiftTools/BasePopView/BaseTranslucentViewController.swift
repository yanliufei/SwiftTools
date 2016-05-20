//
//  BaseTranslucentViewController.swift
//  SwiftTools
//
//  Created by xianchen on 16/5/16.
//  Copyright © 2016年 xianchen. All rights reserved.
//

import UIKit

class BaseTranslucentViewController: UIViewController {

    private var topLeading:NSLayoutConstraint?
    private var mainViewHeight:CGFloat?
    private var defaultTopLeadingHeight:CGFloat?
    private lazy var duration:Double = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        hidenAllVIew()
        modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        navigationController?.navigationBarHidden = true
        navigationController?.navigationBar.translucent = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func hidenAllVIew() -> Void {
        for curview in view.subviews {
            curview.hidden = true
        }
    }
    
    func showAllView() -> Void {
        for curview in view.subviews {
            curview.hidden = false
        }
    }
    
    func settingMainViewHeight(mainHeight:CGFloat, bottomHeight:CGFloat, myTopLeading:NSLayoutConstraint) -> Void {
        mainViewHeight = mainHeight
        defaultTopLeadingHeight =  MyDevice.ScreenHeight() - (bottomHeight + mainHeight + 64)
        print(MyDevice.ScreenHeight())
        topLeading = myTopLeading
        topLeading!.constant = MyDevice.ScreenHeight()
        self.showAllView()
        UIView.animateWithDuration(duration, animations: {
           self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        })
        dispatch_after(UInt64(duration/2.0), dispatch_get_main_queue()) {
            UIView.animateWithDuration(self.duration, animations: {
                self.topLeading!.constant = self.defaultTopLeadingHeight!
                self.view.layoutIfNeeded()
            })
        }
        
    }
    
    func dismiss() -> Void {
        UIView.animateWithDuration(duration) { 
            self.topLeading?.constant = MyDevice.ScreenHeight()
            self.view.layoutIfNeeded()
        }

        dispatch_after(UInt64(duration/2.0), dispatch_get_main_queue()) {
            UIView.animateWithDuration(self.duration, animations: { 
                self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
                }, completion: { (obj) in
                self.dismissViewControllerAnimated(false, completion: {
                })
            })
        }
        
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
