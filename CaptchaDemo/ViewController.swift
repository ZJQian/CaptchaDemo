//
//  ViewController.swift
//  CaptchaDemo
//
//  Created by ZJQ on 2017/3/6.
//  Copyright © 2017年 ZJQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var codeView = CaptchaView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        codeView = CaptchaView.init(frame: CGRect.init(x: 50, y: 100, width: 80, height: 35))
        codeView.isRotation = true
        view.addSubview(codeView)
        codeView.refreshCode { (str) in
            print(str)
        }
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapClick(_:)))
        codeView.addGestureRecognizer(tap)
        
    }

    func tapClick(_ sender: UITapGestureRecognizer) {
        
        codeView.refreshCode { (str) in
            print(str)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

