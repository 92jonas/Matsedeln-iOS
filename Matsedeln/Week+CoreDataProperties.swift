//
//  Week+CoreDataProperties.swift
//  
//
//  Created by Jonas Jacobsson on 2016-03-11.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Week {

    @NSManaged var friday: String?
    @NSManaged var monday: String?
    @NSManaged var thursday: String?
    @NSManaged var thusday: String?
    @NSManaged var wedseday: String?
    @NSManaged var weekNbr: String?

}
