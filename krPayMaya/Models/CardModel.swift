//
//  CardModel.swift
//  krPayMaya
//
//  Created by Amiel Reyes on 11/25/19.
//  Copyright © 2019 AmielReyes. All rights reserved.
//

import Foundation

public struct CardModel : Encodable{
    var card : PayMayaCard
    
    public init(card : PayMayaCard){
        self.card = card
    }
    
}
