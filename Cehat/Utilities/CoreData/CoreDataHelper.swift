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
    
}
