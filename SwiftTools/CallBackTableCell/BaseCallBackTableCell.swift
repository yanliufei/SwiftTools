//
//  BaseCallBackTableCell.swift
//  SwiftTools
//
//  Created by xianchen on 16/5/19.
//  Copyright © 2016年 xianchen. All rights reserved.
//

import UIKit

class BaseCallBackTableCell: UITableViewCell {

    typealias CellClosure = ()->NSIndexPath
    var myClosure:CellClosure?
    
    func initWithClosure(closure:CellClosure) -> Void {
        myClosure = closure
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

