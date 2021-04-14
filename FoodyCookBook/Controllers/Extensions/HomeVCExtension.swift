//
//  HomeVCExtension.swift
//  FoodyCookBook
//
//  Created by Arun Darla on 14/04/21.
//

import Foundation
import UIKit


extension HomeVC:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                
        if collectionView == categoryCollectionView {
            if let someCategories = categories {
                return someCategories.count
            }
        }else {
            
            if let someDishCategories = selectedMeal {
                return someDishCategories.count
            }
        }
        
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == categoryCollectionView {
            
            let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionCell", for: indexPath) as! CategoryCollectionCell
            
            if let dishCategory = categories?[indexPath.row] {
                
                categoryCell.lblCategory.text = dishCategory.strCategory
                
                let imageUrl = URL(string: dishCategory.strCategoryThumb)!
                categoryCell.categoryImage.loadImage(fromURL: imageUrl)
                categoryCell.categoryImage.layer.cornerRadius = categoryCell.categoryImage.frame.height / 2
            }
            
            return categoryCell
            
        } else {
            
            let selectedCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DishesCollectionViewCell", for: indexPath) as! DishesCollectionViewCell
            
            if let selectedDish = selectedMeal?[indexPath.row] {
                
                selectedCell.lblDishName.text = selectedDish.strMeal
                
                
                let imageUrl = URL(string: selectedDish.strMealThumb)!
                selectedCell.dishImage.loadImage(fromURL: imageUrl)
                selectedCell.dishImage.contentMode = .scaleAspectFill
                selectedCell.dishImage.layer.cornerRadius = 10
            }
            
            return selectedCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryCollectionView {
            
            return CGSize(width: 128, height: 128)
            
        }else {
            
            return CGSize(width: collectionView.frame.width / 2 - 5, height: collectionView.frame.height / 1 - 50)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if collectionView == categoryCollectionView {
            
            if let dishCategory = categories?[indexPath.row] {
                
                let selectedCategory = dishCategory.strCategory
                
                self.selectedCategoryDish(searchCat: selectedCategory)
                
                print(selectedCategory)
            }else {
                
            }
            
            
        }
        
        if collectionView == dishesCollectionView {
            
            if let mealReceipe = selectedMeal?[indexPath.row] {
                selectedReceipe = mealReceipe.idMeal
                prasentVCtoReceipeVC()
               
            }
        }
        
    }
    
}

extension HomeVC: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchCategory = nil
        self.resultView.isHidden = true
        self.resultTableView.isHidden = true
        self.resultTableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            self.resultView.isHidden = false
            self.resultTableView.isHidden = false
            self.resultTableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 0 {
            self.findMeal(searchText)
        } else {
            DispatchQueue.main.async {
                self.resultView.isHidden = true
                self.resultTableView.isHidden = true
                self.resultTableView.reloadData()
            }
        }
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let searchCategory = self.searchCategory {
            return searchCategory.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCategoryCell", for: indexPath)
        
        if let meal = self.searchCategory?[indexPath.row] {
            cell.textLabel?.text = meal.strMeal
           
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let meal = self.searchCategory?[indexPath.row] {
            selectedReceipe = meal.idMeal
            prasentVCtoReceipeVC()
            
        }
    }
    
}
