//
//  bundle+extension.swift
//  FKSinaWeibo
//
//  Created by 我是五高你敢信 on 2017/4/11.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import Foundation

extension Bundle {
    
    var nameSpace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
