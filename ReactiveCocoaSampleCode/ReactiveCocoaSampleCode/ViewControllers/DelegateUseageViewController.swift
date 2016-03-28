//
//  DelegateUseageViewController.swift
//  ReactiveCocoaSampleCode
//
//  Created by Erickson on 16/3/28.
//  Copyright © 2016年 paiyipai. All rights reserved.
//

import UIKit

class DelegateUseageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegateUseage()
        
    }
    
    func delegateUseage() {
        let redView = RedView(frame: CGRectMake(0,0,100,100))
        
        redView.backgroundColor = UIColor.redColor()
        view.addSubview(redView)
        redView.rac_signalForSelector(#selector(RedView.btnClick)).subscribeNext { (next) in
            print("点击了按钮")
        }
    }
    
}
