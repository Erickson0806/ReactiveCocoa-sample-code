//
//  ViewController.swift
//  ReactiveCocoaSampleCode
//
//  Created by Erickson on 16/3/28.
//  Copyright © 2016年 paiyipai. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {


    var titles = [String]()
    override func viewDidLoad() {
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        titles = ["开发中常见用法","常见函数","监听事件","代替通知","监听文本框文字改变","处理多个请求，都返回结果的时候，统一做处理"]
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = titles[indexPath.row]
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var viewVv = UIViewController()
        
        if indexPath.row == 0 {
            viewVv = SecondViewController()
        }
        if indexPath.row == 1 {
            viewVv = CustomMacroViewController()
        }
        
        viewVv.title = titles[indexPath.row]

        navigationController?.pushViewController(viewVv, animated: true)
        
    }
    
    
    
    
}






