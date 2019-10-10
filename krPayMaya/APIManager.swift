//
//  APIManager.swift
//  krPayMaya
//
//  Created by Amiel Reyes on 10/9/19.
//  Copyright © 2019 AmielReyes. All rights reserved.
//

import Foundation



public class APIManager : NSObject {
  public typealias Completion = (_ paymayaToken: PayMayaToken?, _ error: String?) -> Void

    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?

    
    var secretKey : String!
    var baseURL : String = "https://fai3dsc13l.execute-api.ap-southeast-1.amazonaws.com/staging/tokens"
    var authorizationHeader : String = "Basic cGstZW80c0wzOTNDV1U1S212ZUpVYVc4VjczMFRUZWkyelk4ekU0ZEhKRHhrRjo="
    override init() {
        super.init()
    }
    init(secret key : String,url : String?, authorization : String?) {
        super.init()
        self.secretKey = key
        if let url = url {
            self.baseURL = url
        }
        if let aut = authorization {
            self.authorizationHeader = aut
        }
    }
    
   public func createPaymentTokenFromCard(card : PayMayaCard, completion : @escaping Completion){
        self.postRequest(params: ["name":card.name,"number":card.number,"expMonth":card.expMonth,"expYear":card.expYear,"cvc":card.cvc,"pk":secretKey], completion: completion)
    }
    
    
    func postRequest(params : [String:String],completion : @escaping Completion){
        
        let header = ["Authorization":authorizationHeader,"Content-Type":"application/json","Origin":"https://cdn.paymaya.com"]
        
        
        let jsonData = try? JSONSerialization.data(withJSONObject: params)
        // create post request
        let url = URL(string: baseURL)!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = header
        request.httpMethod = "POST"


        // insert json data to the request
        request.httpBody = jsonData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
             //   completion(nil,"NO DATA")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                guard let paymentTokenId = responseJSON["paymentTokenId"] as? String,
                    let issuer = responseJSON["issuer"] as? String,
                    let createdAt = responseJSON["createdAt"] as? String,
                    let updatedAt = responseJSON["updatedAt"] as? String,
                    let state = responseJSON["state"] as? String else{

                        completion(nil,"error")

                    return
                }
                let token = PayMayaToken(paymentTokenId: paymentTokenId, state: state, createdAt: createdAt, updatedAt: updatedAt, issuer: issuer)
                    completion(token,nil)
            }else{
                completion(nil,"error")

            }
        }

        task.resume()
    }
    
    
    
    

}
