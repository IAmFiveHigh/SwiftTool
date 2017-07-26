//
//  Date+Extension.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/5/3.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import Foundation

extension Date {
    
    static func dateDistanceWithNow(_ date: String, dateformat: String = "yyyy-MM-dd HH:mm:ss") -> String {
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = dateformat
        
        
        let aimDate = dateFormat.date(from: date)
        let dateInterval = aimDate?.timeIntervalSinceNow
        
        dateFormat.dateFormat = "MM-dd"
        
        guard let wrapDate = aimDate else { return dateformat }
        
        let monthString = dateFormat.string(from: wrapDate)
        
        dateFormat.dateFormat = "yyyy-MM-dd"
        let yearString = dateFormat.string(from: wrapDate)
        if let dateInterval = dateInterval {
            
            let interval = dateInterval * -1
            
            if interval < 60 {
                
                return "一分钟以内"
            }else if interval >= 60 && interval < 60 * 60 {
                
                let min = Int(interval) / 60
                return "\(min)分钟前"
            }else if interval >= 60 * 60 && interval < 60 * 60 * 24 {
                
                let hour = Int(interval / 60 / 60)
                return "\(hour)小时前"
            }else if interval >= 60 * 60 * 24 && interval < 60 * 60 * 24 * 2 {
                
                return "昨天"
            }else if interval >= 60 * 60 * 24 * 2 && interval < 60 * 60 * 24 * 365 {
                
                return monthString
            }else {
                
                return yearString
            }
        }else {
            
            return dateformat
        }
        
    }
}
