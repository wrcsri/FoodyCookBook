//
//  GetSavedRecords.swift
//  FoodyCookBook
//
//  Created by Arun Darla on 14/04/21.
//
import UIKit

import Foundation
import CoreData

func retrieveFavouriteReceipies() {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return
    }
    
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Recipes")
    
    do {
        favouriteReceipes = try managedContext.fetch(fetchRequest)
        
    } catch let error as NSError {
        print("Could not retrive. \(error), \(error.userInfo)")
    }
}
