//
//  FavouritesVCExtension.swift
//  FoodyCookBook
//
//  Created by Arun Darla on 15/04/21.
//

import Foundation
import UIKit


extension FavouritesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allSavedMeals.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteCell", for: indexPath) as! TableViewCell
        
        let favourite = allSavedMeals[indexPath.row]
        
        cell.lblDishName.text = favourite.strMeal
        cell.lblLocName.text = favourite.strArea
        let imageUrl = URL(string: favourite.strMealThumb)!
        cell.imgDish.loadImage(fromURL: imageUrl)
        
            cell.imageView?.layoutIfNeeded()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Saved Recipes"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let meal = allSavedMeals[indexPath.row]
            selectedReceipe = meal.idMeal
            prasentVCtoReceipeVC()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
}
