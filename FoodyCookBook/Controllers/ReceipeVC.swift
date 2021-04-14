//
//  ReceipeVC.swift
//  FoodyCookBook
//
//  Created by Arun Darla on 14/04/21.
//

import UIKit
import CoreData

class ReceipeVC: UIViewController {
    
    @IBOutlet weak var mealImage: ImageCacheView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeLocation: UILabel!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var lblFirstingrd: UILabel!
    @IBOutlet weak var lblSecondingrd: UILabel!
    @IBOutlet weak var lblThirdingrd: UILabel!
    @IBOutlet weak var lblFourthingrd: UILabel!
    @IBOutlet weak var lblFifthingrd: UILabel!
    @IBOutlet weak var lblSixthingrd: UILabel!
    
    
    @IBOutlet weak var instructionTV: UITextView!
    
    
    var myReceipe: ReceipeMeal?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveBtn.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        selectedReceipeImplementation(searchRec: selectedReceipe)
        
        //Get data
        if let data = UserDefaults.standard.data(forKey: "SavedRecords") {
            do{
                allSavedMeals = try JSONDecoder().decode([ReceipeMeal].self, from: data)
            } catch {
                print("Unable to decode data")
            }
        }
        
        let index  = allSavedMeals.firstIndex(where: {$0.idMeal == selectedReceipe})
        
        if index == nil{
            saveBtn.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
            saveBtn.setTitle("Save Recipe", for: .normal)

        }else{
            saveBtn.backgroundColor = #colorLiteral(red: 0.2732411359, green: 0.5655536168, blue: 0.1844392002, alpha: 1)
            saveBtn.setTitle("Recipe Saved", for: .normal)
        }
        
    }
    
    
}

// Save selected receipe implementation
extension ReceipeVC {
    
    @IBAction func backTapOn(_ sender: UIButton) {
        self.dismiss(animated: true) {
            print("Dismissing view controller")
        }
    }
    
    
    
    @IBAction func didTapOnSave(_ sender: UIButton) {
        if let receipe = self.myReceipe {
            print("Old count: \(allSavedMeals.count)")
            
            let index  = allSavedMeals.firstIndex(where: {$0.idMeal == receipe.idMeal})
            if index == nil{
                allSavedMeals.append(receipe)
                saveBtn.backgroundColor = #colorLiteral(red: 0.2732411359, green: 0.5655536168, blue: 0.1844392002, alpha: 1)
                saveBtn.setTitle("Recipe Saved", for: .normal)

            }else{
                allSavedMeals.remove(at: index!)
                saveBtn.setTitle("Save Recipe", for: .normal)
                self.saveBtn.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
            }
            
            if allSavedMeals.count != 0 {
                //Set data
                if let encoded = try? JSONEncoder().encode(allSavedMeals) {
                    UserDefaults.standard.set(encoded, forKey: "SavedRecords")
                }
            }else{
                UserDefaults.standard.removeObject(forKey: "SavedRecords")
                UserDefaults.standard.synchronize()
            }
            
            print("New count: \(allSavedMeals.count)")
            
          
            
        }
    }
    
}







