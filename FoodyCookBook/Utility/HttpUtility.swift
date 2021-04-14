//
//  HttpUtility.swift
//  FoodyCookBook
//
//  Created by Arun Darla on 14/04/21.
//

import Foundation


struct HttpUtility
{
    static let shared = HttpUtility()
    private init(){}

    func performDataTask<T:Decodable>(urlRequest: URLRequest, resultType: T.Type, completionHandler:@escaping(_ result: T?)-> Void){
        
        URLSession.shared.dataTask(with: urlRequest) { (responseData, httpUrlResponse, err) in
            if(err == nil && responseData != nil && responseData?.count != 0)
            {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    _=completionHandler(result)
                }
                catch {
                    _=completionHandler([] as? T)
                    debugPrint("error occured while decoding = \(error.localizedDescription)")
                }
            }

        }.resume()
    }
}
