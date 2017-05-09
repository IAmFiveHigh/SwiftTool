//
//  PrintModelList.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/4/20.
//  Copyright © 2017年 每天农资. All rights reserved.
//

import UIKit

class PrintModelList: NSObject {

    
    static func printList(with dict: [String: Any]) {
        
        for key in dict.keys {
            print("var \(key.utf8) = \"\"")
        }
    }
}

