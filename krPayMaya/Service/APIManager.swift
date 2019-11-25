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
    static var shared = APIManager()
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    
    var secretKey : String!
    var baseURL : String = "https://pg-sandbox.paymaya.com/payments/v1/payment-tokens"
    var authorizationHeader : String = "Basic cGstWjBPU3pMdkljT0kyVUl2RGhkVEdWVmZSU1NlaUdTdG5jZXF3VUU3bjBBaDo="
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
    
     func createPaymentTokenFromCard(card : PayMayaCard, completion : @escaping Completion){
        self.postRequest(card: card, completion: completion)
    }
    
    
    func postRequest(card : PayMayaCard,completion : @escaping Completion){
        
        let header = ["Authorization":authorizationHeader,"Content-Type":"application/json","Origin":"https://cdn.paymaya.com"]
        
        // create post request
        let url = URL(string: baseURL)!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = header
        request.httpMethod = "POST"
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        do {
            let encoded = try encoder.encode(CardModel.init(card: card))
            request.httpBody = encoded
        } catch {
            fatalError("json encoding failed error")
        }

        // insert json data to the request

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
             //   completion(nil,"NO DATA")
                completion(nil,"error NO DATA")
                return
            }
            
            do {
                let token = try decoder.decode(PayMayaToken.self, from: data)
                completion(token,nil)
            }catch {
                completion(nil,"error")
            }
        }

        task.resume()
    }
    
    
    
    

}
