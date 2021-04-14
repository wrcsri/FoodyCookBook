//
//  SelectedCategoryResponse.swift
//  FoodyCookBook
//
//  Created by Arun Darla on 14/04/21.
//

import Foundation

struct SelectedCategoryResponse: Codable {
    let meals: [Meal]
}

// MARK: - Meal
struct Meal: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

