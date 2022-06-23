//
//  CoreDataHelper.swift
//  Cehat
//
//  Created by Muhammad Farhan Almasyhur on 15/06/22.
//

import Foundation
import CoreData
import UIKit

class CoreDataHelper {
    
    let container: NSPersistentContainer!
    let viewContext: NSManagedObjectContext!
    
    init(){
        container = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
        viewContext = container.viewContext
    }
    
    func getBackgroundContext() -> NSManagedObjectContext{
        if let context = container?.newBackgroundContext() {
            return context
        } else {
            return viewContext
        }
    }
    
    func saveContext(saveContext: NSManagedObjectContext? = nil) {
        guard let context = saveContext else { return }
        do {
            try context.save()
        } catch let error as NSError {
            print("error: \(error)")
        }
    }
    
}
