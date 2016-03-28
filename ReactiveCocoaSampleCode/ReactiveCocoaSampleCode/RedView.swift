//
//  RedView.swift
//  ReactiveCocoaSampleCode
//
//  Created by Erickson on 16/3/28.
//  Copyright © 2016年 paiyipai. All rights reserved.
//

import UIKit

class RedView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        let btn = UIButton()
        btn.frame = frame
        self.addSubview(btn)
        btn.addTarget(self, action: #selector(btnClick), forControlEvents: .TouchUpInside)
        
        
    }
    
    func btnClick() {}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
