//
//  ManagedFavorite+CoreDataProperties.swift
//  Cehat
//
//  Created by Muhammad Farhan Almasyhur on 25/06/22.
//
//

import Foundation
import CoreData


extension ManagedFavorite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedFavorite> {
        return NSFetchRequest<ManagedFavorite>(entityName: "ManagedFavorite")
    }

    @NSManaged public var idMenu: Int32

}

extension ManagedFavorite : Identifiable {

}
