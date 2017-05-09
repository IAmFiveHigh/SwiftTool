//
//  BaseModel.swift
//  优快学车Boss
//
//  Created by 我是五高你敢信 on 2016/12/31.
//  Copyright © 2016年 我是五高你敢信. All rights reserved.
//

import UIKit

class BaseModel: NSObject {


    init(dict: [String: Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
