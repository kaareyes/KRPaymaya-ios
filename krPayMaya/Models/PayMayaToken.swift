//
//  PayMayaToken.swift
//  krPayMaya
//
//  Created by Amiel Reyes on 10/9/19.
//  Copyright © 2019 AmielReyes. All rights reserved.
//

import Foundation


public struct PayMayaToken : Decodable {
   public var paymentTokenId : String
   public var state : String
   public var createdAt : String
   public var updatedAt : String
   public var issuer : String
    
   public init(paymentTokenId : String,state : String,createdAt : String,updatedAt :String,issuer : String ) {
        self.paymentTokenId = paymentTokenId
        self.state = state
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.issuer = issuer
    }
}
