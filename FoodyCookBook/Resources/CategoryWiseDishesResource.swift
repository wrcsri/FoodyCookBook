//
//  CategoryWiseDishes.swift
//  FoodyCookBook
//
//  Created by Arun Darla on 14/04/21.
//

import Foundation
import UIKit

struct CategoryWiseDishesResource {
    
    
    func getItems(completionHandler:@escaping(_ result:CategoryWiseDishesResponse?)-> Void) {
        guard let url = URL(string: "\(API.allCategories)?api_key=\(API.key)") else {return}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        HttpUtility.shared.performDataTask(urlRequest: urlRequest, resultType: CategoryWiseDishesResponse.self) { (categoryWiseDishesResponse) in
            
            _=completionHandler(categoryWiseDishesResponse)
        }
        
        
    }
    
    
    
}




