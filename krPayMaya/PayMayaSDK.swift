//
//  PayMayaSDK.swift
//  krPayMaya
//
//  Created by Amiel Reyes on 10/9/19.
//  Copyright © 2019 AmielReyes. All rights reserved.
//

import Foundation
import UIKit


public class PayMayaSDK {
  public static let shared =  PayMayaSDK()
   public var apimanager : APIManager?

   public enum environment : String {
        case production = "production"
        case staging = "staging"
    }
    
 public func setPaymentSecretKey(key : String,productURL : String? = nil, environment : environment,authorization : String? = nil){
        if environment == .staging {
            self.apimanager = APIManager(secret: key, url: productURL,authorization: authorization)
        }else{
            self.apimanager = APIManager(secret: key, url: productURL,authorization: authorization)
        }

    }
    
    public func showCreditCardInput(){
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            let creditcard = CreditCardInputViewController()
            topController.present(creditcard, animated: true, completion: nil)
        }
        
    }
    
}
