//
//  CustomMacroViewController.swift
//  ReactiveCocoaSampleCode
//
//  Created by Erickson on 16/3/28.
//  Copyright © 2016年 paiyipai. All rights reserved.
//

import UIKit


class CustomMacroViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.translucent = false
        view.backgroundColor = UIColor.whiteColor()

    }
    
    // MARK: - RACTuple 包装数据
    func tuplePach() {
        
        let arr = [1,2,4]
        let tuple = RACTuple(objectsFromArray: arr)
        print(tuple)
        
        
        
        
    }
    
    
    
    
    // MARK: - RACObserve(self, name):监听某个对象的某个属性,返回的是信号
    func racObserve() {
        RACObserve(self, keyPath: "title").subscribeNext { (next) in
            print(next)
        }
    }
    func RACObserve(target: NSObject!, keyPath: String) -> RACSignal  {
        return target.rac_valuesForKeyPath(keyPath, observer: target)
    }
    
    
    
    // MARK: - RAC(TARGET, [KEYPATH, [NIL_VALUE]]):用于给某个对象的某个属性绑定。

    func racTest() {
        
        let lab = UILabel(frame: CGRectMake(40,64,200,20))
        lab.backgroundColor = UIColor.redColor()
        view.addSubview(lab)
        let textField = UITextField(frame: CGRectMake(0,84,200,30))
        textField.borderStyle = .Line
        textField.backgroundColor = UIColor.yellowColor()
        view.addSubview(textField)
        
       RAC(lab, "text").assignSignal(textField.rac_textSignal())
        
    }
    
    
}






