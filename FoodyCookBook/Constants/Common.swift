//
//  Common.swift
//  FoodyCookBook
//
//  Created by Arun Darla on 14/04/21.
//

import Foundation
import UIKit
import CoreData

var allSavedMeals = [ReceipeMeal]()
var selectedReceipe: String = ""

struct SegueIdentifier{
    static let moveToRecepies = "moveToRecipeVC"
    static let moveFromFav = "moveToRecipeVC1"
}

struct API {
    static let key: String = "1"
    static let allCategories: String = "https://www.themealdb.com/api/json/v1/1/categories.php"
    static let filteredByCategory: String = "https://www.themealdb.com/api/json/v1/1/filter.php?c="
    static let searchByName: String = "https://www.themealdb.com/api/json/v1/1/search.php?s="
    static let searchById: String = "https://www.themealdb.com/api/json/v1/1/lookup.php?i="
}

struct GlobalVariable {
    
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
}


