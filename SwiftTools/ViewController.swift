//
//  ViewController.swift
//  SwiftTools
//
//  Created by xianchen on 16/4/25.
//  Copyright © 2016年 xianchen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let app = UIApplication.sharedApplication()
        let setting = UIUserNotificationSettings(forTypes: UIUserNotificationType.Badge, categories: nil)
        app.registerUserNotificationSettings(setting)
        app.applicationIconBadgeNumber = 20;
        self.view.userInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.clickView))
        self.view.addGestureRecognizer(gesture)
        
        let label = UILabel()
        label.frame = CGRectMake(100, 100, 200, 30);
        label.text = "显示内容"
        label.textColor = UIColor.redColor()
        view.addSubview(label)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func clickView() -> Void {
        let test = TestViewController()
        presentViewController(test, animated: false) {
            test.defaultSetting()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

