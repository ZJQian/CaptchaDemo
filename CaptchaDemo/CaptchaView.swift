//
//  CaptchaView.swift
//  CaptchaDemo
//
//  Created by ZJQ on 2017/3/6.
//  Copyright © 2017年 ZJQ. All rights reserved.
//

import UIKit

let ARC4RAND_MAX = 0x100000000



class CaptchaView: UIView {

    fileprivate var codeArray = Array<String>()
    fileprivate var bgView = UIView()
    fileprivate var codeStr = NSString()
    var isRotation = Bool()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        codeArray = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
        
        
    }
    
    
    public func refreshCode(callBack: @escaping (_ str: NSString) -> ()) {
    
        initCodeView()
        callBack(codeStr)
        
    }
    
    private func initCodeView () {
    
        
        for index in 0..<4 {
            
            let i = (Int)(arc4random()) % (codeArray.count-1)
            let str = codeArray[i]
            
            if index == 0 {
                codeStr = str as NSString
            }else {
                codeStr = "\(codeStr)\(str)" as NSString
            }
            
            
        }
        
        bgView.removeFromSuperview()
        bgView = UIView.init(frame: self.bounds)
        addSubview(bgView)
        bgView.backgroundColor = UIColor.getRandomColor(withAlpha: 0.5)
        
        let str = "W" as NSString
        let textSize = str.size(attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 20)])
        let randWidth = self.frame.size.width / (CGFloat)(codeStr.length) - textSize.width
        let randHeight = self.frame.size.height - textSize.height
        
        for i in 0..<codeStr.length {
            let pxx = arc4random() % UInt32(randWidth)
            
            let px = CGFloat(pxx) + CGFloat(i)*(self.frame.size.width-3)/CGFloat(codeStr.length)
            let py = arc4random() % UInt32(randHeight)
            
            
            let label = UILabel.init(frame: CGRect.init(x: px + 3, y: CGFloat(py), width: textSize.width, height: textSize.height))
            label.text = String.init(format: "%C", codeStr.character(at: i))
            label.font = UIFont.systemFont(ofSize: 20)
            if (isRotation == true) {
                let a = arc4random() % UInt32(60)
                let r = Double(a)-30

                label.transform = CGAffineTransform.init(rotationAngle: CGFloat(r*M_PI)/180)
            }
            
            bgView.addSubview(label)
        }
        
        
        //作用是给底部view是随便画几条细线
        for _ in 0...9 {
        
            
            let path = UIBezierPath.init()
            let pX = arc4random() % UInt32(self.frame.width)
            let pY = arc4random() % UInt32(self.frame.height)
            path.move(to: CGPoint.init(x: CGFloat(pX), y: CGFloat(pY)))
            let ptX = arc4random() % UInt32(self.frame.width)
            let ptY = arc4random() % UInt32(self.frame.height)
            path.addLine(to: CGPoint.init(x: CGFloat(ptX), y: CGFloat(ptY)))
            
            let layer = CAShapeLayer.init()
            layer.strokeColor = UIColor.getRandomColor(withAlpha: 0.2).cgColor//layer的边框色
            layer.lineWidth = 1.0
            layer.strokeEnd = 1
            layer.fillColor = UIColor.clear.cgColor
            layer.path = path.cgPath
            bgView.layer.addSublayer(layer)

        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
