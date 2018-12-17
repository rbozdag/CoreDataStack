//
//  CoreDataClass.swift
//  RBCoreDataStack
//
//  Created by Rahmi on 15.12.2018.
//  Copyright © 2018 rbozdag. All rights reserved.
//

import Foundation
import CoreData

public protocol CoreDataClass where Self: NSManagedObject {
    static var Name: String { get }
}

public extension CoreDataClass {
    public static func createNewMo(context: NSManagedObjectContext) -> Self? {
        let mo = NSEntityDescription.insertNewObject(forEntityName: NoteCollectionEntity.Name, into: context) as? Self
        return mo
    }
}
