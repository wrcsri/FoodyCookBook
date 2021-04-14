//
//  SelectedCategory.swift
//  FoodyCookBook
//
//  Created by Arun Darla on 14/04/21.
//

import Foundation

import UIKit

struct SelectedCategoryResource {
    
    
    func getItems(searchCategory:String, completionHandler:@escaping(_ result:SelectedCategoryResponse?)-> Void) {
        guard let url = URL(string: API.filteredByCategory+searchCategory) else {return}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        HttpUtility.shared.performDataTask(urlRequest: urlRequest, resultType: SelectedCategoryResponse.self) { (selectedCategoryResponse) in
            
            _=completionHandler(selectedCategoryResponse)
        }
        
        
    }
    
    func fetchItems(searchText: String, completionHandler:@escaping(_ result:SelectedCategoryResponse?)-> Void) {
        guard let url = URL(string: API.searchByName+searchText) else {return}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        HttpUtility.shared.performDataTask(urlRequest: urlRequest, resultType: SelectedCategoryResponse.self) { (selectedCategoryResponse) in
            
            _=completionHandler(selectedCategoryResponse)
        }
        
        
    }
    
}


