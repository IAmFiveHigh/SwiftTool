//
//  NetWorkManager.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/4/20.
//  Copyright © 2017年 每天农资. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import Alamofire
import SVProgressHUD

private let networkManager = NetWorkManager()

final class NetWorkManager {
    static var shard: NetWorkManager {
        return networkManager
    }
    
}

extension NetWorkManager {
    
    func postRequest(urlString : String, params : [String : Any], hud: Bool = false, type: RequsetType = .normal, success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) {
        
        if hud && type == .normal {
            SVProgressHUD.show()
        }
        
        Alamofire.request(urlString, method: HTTPMethod.post, parameters: params).responseJSON { (response) in
            
            switch response.result{
            case .success:
                if let value = response.result.value as? [String: AnyObject] {
                    success(value)
                    let json = JSON(value)
                    print(json)
                }
            case .failure(let error):
                failture(error)
                print("error:\(error)")
            }
            
            if hud && type == .normal {
                SVProgressHUD.dismiss()
            }
        }
    }
    
    func postRequest(urlString : String, success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) {
        
        
        Alamofire.request(urlString).responseJSON { (response) in
            switch response.result{
            case .success:
                if let value = response.result.value as? [String: AnyObject] {
                    success(value)
                    let json = JSON(value)
                    print(json)
                }
            case .failure(let error):
                failture(error)
                print("error:\(error)")
            }
            
        }
    }

}

