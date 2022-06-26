//
//  ManagedHistory+CoreDataProperties.swift
//  Cehat
//
//  Created by Muhammad Farhan Almasyhur on 24/06/22.
//
//

import Foundation
import CoreData


extension ManagedHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedHistory> {
        return NSFetchRequest<ManagedHistory>(entityName: "ManagedHistory")
    }

    @NSManaged public var date: String?
    @NSManaged public var idMenu: [Int]?

}

extension ManagedHistory : Identifiable {

}
