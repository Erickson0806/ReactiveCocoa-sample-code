//
//  SecondViewController.swift
//  ReactiveCocoaSampleCode
//
//  Created by Erickson on 16/3/28.
//  Copyright © 2016年 paiyipai. All rights reserved.
//
// 


/*
 
 ReactiveCocoa开发中常见用法。
 1 代替代理:
 * rac_signalForSelector：用于替代代理。
 2 代替KVO :
 * rac_valuesAndChangesForKeyPath：用于监听某个对象的属性改变。
 3 监听事件:
 * rac_signalForControlEvents：用于监听某个事件。
 4 代替通知:
 * rac_addObserverForName:用于监听某个通知。
 5 监听文本框文字改变:
 * rac_textSignal:只要文本框发出改变就会发出这个信号。
 6 处理当界面有多次请求时，需要都获取到数据时，才能展示界面
 * rac_liftSelector:withSignalsFromArray:Signals:当传入的Signals(信号数组)，每一个signal都至少sendNext过一次，就会去触发第一个selector参数的方法。
 * 使用注意：几个信号，参数一的方法就几个参数，每个参数对应信号发出的数据。

 */

import UIKit



class SecondViewController: UIViewController {

    var command: RACCommand!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        navigationController?.navigationBar.translucent = false
        
        mutilableResult()
    }
    
    
    // MARK: - 处理多个请求，返回结果的时候，统一处理
    func mutilableResult() {
        let request1 = RACSignal.createSignal { (subscriber) -> RACDisposable! in
            subscriber.sendNext("发送请求1")
            return nil
        }
        let request2 = RACSignal.createSignal { (subscriber) -> RACDisposable! in
            subscriber.sendNext("发送请求2")
            return nil
        }
        
        rac_liftSelector(#selector(update (_:data2:)), withSignalsFromArray: [request1,request2])
        
    }
    
    
    
    func update(data1:AnyObject,data2:AnyObject) {
        print("更新UI：\(data1),\(data2)")
    }
    
    func textChanged() {
        let text = UITextField(frame: CGRectMake(0,0,200,50))
        text.backgroundColor = UIColor.redColor()
        view.addSubview(text)
        text.rac_textSignal().subscribeNext { (next) in
            print("文字改变了：\(next)")
        }
    }
    
    // MARK: - 监听事件
    func controlEvent() {
        
        let btn = UIButton()
        btn.rac_signalForControlEvents(.TouchDown).subscribeNext { (next) in
            print("点击了")
        }
    }
    
    // MARK: - KVO
    func kvoUseage() {
        
        let redView = RedView(frame: CGRectMake(0,0,100,100))
        
        redView.backgroundColor = UIColor.redColor()
        view.addSubview(redView)
    }
    // MARK: - NotificationCenter
    func notificationUseage() {
        let textField = UITextField(frame: CGRectMake(0,0,300,90))
        textField.backgroundColor = UIColor.yellowColor()
        view.addSubview(textField)
        
        
        NSNotificationCenter.defaultCenter().rac_addObserverForName(UIKeyboardWillShowNotification, object: nil).subscribeNext { (next) in
            print("键盘弹起")
        }
    }
    
    // MARK: - delegate
    func delegateUseage() {
        let redView = RedView(frame: CGRectMake(0,0,100,100))
        
        redView.backgroundColor = UIColor.redColor()
        view.addSubview(redView)
        redView.rac_signalForSelector(#selector(RedView.btnClick)).subscribeNext { (next) in
            print("点击了按钮")
        }
    }

}
