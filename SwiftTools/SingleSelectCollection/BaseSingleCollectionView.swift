//
//  BaseSingleCollectionView.swift
//  SwiftTools
//
//  Created by xianchen on 16/5/19.
//  Copyright © 2016年 xianchen. All rights reserved.
//

import UIKit

class BaseSingleCollectionView: UICollectionView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    enum SelectCellType {
        case SingleSelectRoundType
        case SingleSelectFillType
    }
    
    lazy var statusArray:NSMutableArray = {
        return NSMutableArray()
    }()
    var valueArray:NSArray = {
        return NSArray()
    }()
    var cornerRadius:CGFloat?
    var cellBoardColor:UIColor?
    var cellFillColor:UIColor?
    var selectType:SelectCellType?
    //- (void)setParmsWithValues:(NSArray *)cellValueArray CornerRadius:(CGFloat)cornerRadius CellBoardColor:(UIColor *)cellBoardColor CellFillColor:(UIColor *)cellFillColor;
    
    typealias SelectClosure = ()->Int
    var cellClosure:SelectClosure?
    func setParmsWithValues(cellValueArray:NSArray, CornerRadius:CGFloat, CellBoardColor:UIColor, CellFillColor:UIColor) -> Void {
        backgroundColor = UIColor.whiteColor()
        valueArray = cellValueArray
        cornerRadius = CornerRadius
        cellBoardColor = CellBoardColor
        cellFillColor = CellFillColor
    }
    
}

