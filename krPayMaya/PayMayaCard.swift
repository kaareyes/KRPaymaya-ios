//
//  PayMayaCard.swift
//  krPayMaya
//
//  Created by Amiel Reyes on 10/9/19.
//  Copyright © 2019 AmielReyes. All rights reserved.
//

import Foundation


public struct PayMayaCard {
   public var name : String
   public var number : String
   public var expMonth : String
   public var expYear : String
   public var cvc : String
    
   public init(name:String,number:String,expMonth:String,expYear:String,cvc:String){
        self.name = name
        self.number = number
        self.expMonth = expMonth
        self.expYear = expYear
        self.cvc = cvc
    }
}
