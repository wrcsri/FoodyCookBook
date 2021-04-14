//
//  RecipeVCExtension.swift
//  FoodyCookBook
//
//  Created by Arun Darla on 14/04/21.
//

import Foundation
import UIKit

extension HomeVC {
   
    func prasentVCtoReceipeVC() {
        
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ReceipeVC") as! ReceipeVC
        let navigationController: UINavigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.navigationBar.isHidden = true
        present(navigationController, animated: true, completion: nil)
    }
}

extension FavouritesVC {
   
    func prasentVCtoReceipeVC() {
        
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ReceipeVC") as! ReceipeVC
        let navigationController: UINavigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.navigationBar.isHidden = true
        present(navigationController, animated: true, completion: nil)
    }
}

//Get selected receipe Details implementation
extension ReceipeVC {
    
    func selectedReceipeImplementation(searchRec: String) {
        
        let selecetedReceipeResoure = SelectedReceipeResource()
        
        selecetedReceipeResoure.getItems(searchCategory: searchRec) { (selectedReceipe) in
            
            DispatchQueue.main.async {
                self.handleRecipe(selectedReceipe)
            }
            
        }
    }
    
    func handleRecipe(_ recipe: ReceipeResponse?) {
        
        if let meal = recipe?.meals.first {
            self.myReceipe = meal
            self.recipeName.text = meal.strMeal
            self.recipeLocation.text = meal.strArea
            self.instructionTV.text = meal.strInstructions
            self.lblFirstingrd.text = meal.strIngredient1
            self.lblSecondingrd.text = meal.strIngredient2
            self.lblThirdingrd.text = meal.strIngredient3
            self.lblFourthingrd.text = meal.strIngredient4
            self.lblFifthingrd.text = meal.strIngredient5
            self.lblSixthingrd.text = meal.strIngredient6
            
            let imageUrl = URL(string: meal.strMealThumb)!
            self.mealImage.loadImage(fromURL: imageUrl)

            
        }
       
    }
    
    
}


