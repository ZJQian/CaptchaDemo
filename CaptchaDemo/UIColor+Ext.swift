//
//  UIColor+Ext.swift
//  CaptchaDemo
//
//  Created by ZJQ on 2017/3/6.
//  Copyright © 2017年 ZJQ. All rights reserved.
//

import UIKit

extension UIColor {

    
    /// 获取随机颜色
    ///
    /// - Parameter alpha: 透明度alpha
    /// - Returns: color
    class func getRandomColor(withAlpha alpha: Float) -> UIColor {
    
        let r = arc4random() % 100
        let g = arc4random() % 100
        let b = arc4random() % 100
        
        let color = UIColor.init(colorLiteralRed: (Float)(r)/100.0, green: (Float)(g)/100.0, blue: (Float)(b)/100.0, alpha: alpha)
        
        return color
    
    }
}
