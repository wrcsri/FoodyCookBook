//
//  SelectedReceipeResource.swift
//  FoodyCookBook
//
//  Created by Arun Darla on 14/04/21.
//

import Foundation

struct SelectedReceipeResource {
    
    
    func getItems(searchCategory:String, completionHandler:@escaping(_ result:ReceipeResponse?)-> Void) {
        guard let url = URL(string: API.searchById+searchCategory) else {return}
        
        var urlRequest = URLRequest(url: url)
        
        print(urlRequest)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        HttpUtility.shared.performDataTask(urlRequest: urlRequest, resultType: ReceipeResponse.self) { (receipeResponse) in
            
            _=completionHandler(receipeResponse)
        }
        
        
    }
    
    
    
}
