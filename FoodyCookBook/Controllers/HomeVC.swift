//
//  ViewController.swift
//  FoodyCookBook
//
//  Created by Arun Darla on 13/04/21.
//

import UIKit

class HomeVC: UIViewController {
    
    var categories: [Category]?
    var selectedMeal: [Meal]?
    var searchCategory: [Meal]?
    var isDishesReloaded:Bool = false
    
    @IBOutlet weak var mySearchBar: UISearchBar!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var dishesCollectionView: UICollectionView!
    @IBOutlet weak var resultTableView: UITableView!
    @IBOutlet weak var resultView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        dishesCollectionView.delegate = self
        dishesCollectionView.dataSource = self
        mySearchBar.delegate = self
        resultTableView.delegate = self
        resultTableView.dataSource = self
        resultTableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        self.resultView.isHidden = true
        self.resultTableView.isHidden = true
        getCategoryWiseDishes()
        mySearchBar.text = ""
        self.resultView.isHidden = true
    
    }
        
    func getCategoryWiseDishes() {
        let categoryWiseDishesResource = CategoryWiseDishesResource()
        categoryWiseDishesResource.getItems { (categoryDishesResponse) in
            
            self.categories = categoryDishesResponse?.categories
            self.categories = self.categories?.sorted(by: { $0.strCategory < $1.strCategory })
            
            DispatchQueue.main.async {
                self.categoryCollectionView.reloadData()
            }
            
            DispatchQueue.global(qos: .background).async {
                let selectedCategory = self.categories?[0].strCategory
                self.selectedCategoryDish(searchCat: selectedCategory ?? "")
            }
        }
    }
    
    func selectedCategoryDish(searchCat: String) {
        let selectedCategoryResource = SelectedCategoryResource()
        selectedCategoryResource.getItems(searchCategory: searchCat) { (selectedCategoryResponse) in
            self.selectedMeal = selectedCategoryResponse?.meals

            DispatchQueue.main.async {
                self.dishesCollectionView.reloadData()
            }
        }
        
    }
    
    func findMeal(_ searchText: String) {
        let findCategoryResource = SelectedCategoryResource()
        findCategoryResource.fetchItems(searchText: searchText) { (response) in
            self.searchCategory = response?.meals
            print("Empty records count : \(String(describing: self.searchCategory?.count))")
            if  self.searchCategory?.count != 0{
                DispatchQueue.main.async {
                    self.resultView.isHidden = false
                    self.resultTableView.isHidden = false
                    self.resultTableView.reloadData()
                }
            }else{
                print("Empty records")
            }
            
        }
    }
    
}










