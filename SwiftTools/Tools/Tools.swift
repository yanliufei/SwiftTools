//
//  Tools.swift
//  SwiftTools
//
//  Created by xianchen on 16/5/16.
//  Copyright © 2016年 xianchen. All rights reserved.
//

import UIKit

class UITools: NSObject {
    private  var countTime:Int?
    private var curTime:Int?
    private  var timer:NSTimer?
    private var curBtn:UIButton?
    
    func countDown(time:Int, button:UIButton) -> Void {

            countTime = time
            curTime = time
            curBtn = button
            
            curBtn!.setTitle("\(curTime)".deleteOptionalString(), forState: UIControlState.Selected)
            curBtn!.addTarget(self, action: #selector(CountDonwClick), forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    func CountDonwClick() -> Void {
            curBtn!.selected = true
            curBtn?.userInteractionEnabled = false
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(autoCountDown), userInfo: nil, repeats: true)
    }
    
    func autoCountDown() -> Void {
        curTime? -= 1
        if curTime == 0 {
            curBtn!.selected = false
            curBtn?.userInteractionEnabled = true
            curTime = countTime
            timer!.invalidate()
        }

//        print(showString.substringWithRange(NSMakeRange(9, 1)))
        curBtn!.setTitle("\(curTime)".deleteOptionalString(), forState: UIControlState.Selected)
    }
    
    typealias viewGesture = ()->Void
    var tapGesture:viewGesture?
    func gesture(click:viewGesture, tapview:UIView) -> Void {
        tapGesture = click
        tapview.userInteractionEnabled = true
        tapview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.clickView)))
    }
    
    func clickView() -> Void {
        tapGesture!()
    }
}
