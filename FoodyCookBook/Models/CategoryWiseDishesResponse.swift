//
//  CategoryWiseDishesResponse.swift
//  FoodyCookBook
//
//  Created by Arun Darla on 14/04/21.
//

import Foundation

//struct CategoryWiseDishesResponse: Decodable {
//    let result: Categories
//    
//}

struct CategoryWiseDishesResponse: Decodable {
    let categories: [Category]
    
}

struct Category: Decodable {
    let idCategory, strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
    
}


//struct CategoryWiseDishesResponse: Decodable {
//    let categories: [Category]
//}
//
//// MARK: - Category
//struct Category: Decodable {
//    let idCategory, strCategory: String
//    let strCategoryThumb: String
//    let strCategoryDescription: String
////}
