//
//  RACExtension.swift
//  ReactiveCocoaSampleCode
//
//  Created by Erickson on 16/3/28.
//  Copyright © 2016年 paiyipai. All rights reserved.
//

import Foundation


struct RAC {
    var target: NSObject!
    var keyPath: String!
    var nilValue: AnyObject!
    
    init(_ target: NSObject!, _ keyPath: String, nilValue: AnyObject? = nil) {
        self.target = target
        self.keyPath = keyPath
        self.nilValue = nilValue
    }
    
    func assignSignal(signal: RACSignal) {
        signal.setKeyPath(self.keyPath, onObject: self.target, nilValue: self.nilValue)
    }
}

infix operator  <~ {}
infix operator  ~> {}

func <~ (rac: RAC, signal: RACSignal) {
rac.assignSignal(signal)
}

func ~> (signal: RACSignal, rac: RAC) {
rac.assignSignal(signal)
}
