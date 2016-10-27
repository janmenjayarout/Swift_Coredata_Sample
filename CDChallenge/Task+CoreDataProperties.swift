//
//  Task+CoreDataProperties.swift
//  CDChallenge
//
//  Created by Jan on 10/26/16.
//  Copyright © 2016 Jan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Task {

    @NSManaged var age: String?
    @NSManaged var amount: String?
    @NSManaged var isImportant: NSNumber?
    @NSManaged var name: String?

}
