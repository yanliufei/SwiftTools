//
//  TestViewController.swift
//  SwiftTools
//
//  Created by xianchen on 16/5/16.
//  Copyright © 2016年 xianchen. All rights reserved.
//

import UIKit

class TestViewController: BaseTranslucentViewController {
    
    @IBOutlet weak var countTimeBtn: UIButton!
    lazy var tools:UITools? = {
        return UITools()
    }()
    
    @IBOutlet weak var btnTopLeading: NSLayoutConstraint!
    @IBAction func hidenVIew(sender: AnyObject) {
        dismiss()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tools?.countDown(10, button: countTimeBtn)
        // Do any additional setup after loading the view.
        btnTopLeading.constant = MyDevice.ScreenHeight()
    }
    
    func defaultSetting() -> Void {
        self.settingMainViewHeight(30, bottomHeight: 10, myTopLeading: btnTopLeading)
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
