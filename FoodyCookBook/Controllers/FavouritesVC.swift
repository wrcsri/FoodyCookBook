//
//  FavouritesVC.swift
//  FoodyCookBook
//
//  Created by Arun Darla on 13/04/21.
//

import UIKit
import CoreData

class FavouritesVC: UIViewController {

    @IBOutlet weak var favouriteTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.favouriteTableView.delegate = self
        self.favouriteTableView.dataSource = self
        self.favouriteTableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        retrieveFavouriteReceipies()
        
        
    }


    public func retrieveFavouriteReceipies() {
       
        //Get data
        if let data = UserDefaults.standard.data(forKey: "SavedRecords") {
            do{
                allSavedMeals = try JSONDecoder().decode([ReceipeMeal].self, from: data)
            } catch {
                print("Unable to decode data")
            }
        }
        
        favouriteTableView.reloadData()
        
    }

}


