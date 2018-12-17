//
//  NoteCollectionEntity+CoreDataClass.swift
//  RBCoreDataStack
//
//  Created by Rahmi on 14.12.2018.
//  Copyright © 2018 rbozdag. All rights reserved.
//

import Foundation
import CoreData
import UIKit

public class NoteCollectionEntity: NSManagedObject, CoreDataClass {
    public static let Name = "NoteCollectionEntity"

    func getColor() -> UIColor {
        return UIColor(rgbValue: colorOfFlag)
    }
}
