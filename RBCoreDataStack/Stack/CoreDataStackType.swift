//
//  CoreDataStack.swift
//  RBCoreDataStack
//
//  Created by Rahmi on 13.12.2018.
//  Copyright © 2018 rbozdag. All rights reserved.
//     https://cocoacasts.s3.amazonaws.com/what-is-the-core-data-stack/figure-core-data-stack-1.jpg
//

import Foundation
import CoreData

protocol CoreDataStack {
    /**
     Load object model file from bundle. it exposes model file for core data stack. It is scheme of database. It describes the data of application.
     */
    var model: NSManagedObjectModel { mutating get }

    /**
     It is how you interact with the Core Data Stack. Managed object context keeps a reference of persistant store coordinator.
     It manages collection of model objects. We can use to save, fetch and update to persistent store of application.
    */
    var context: NSManagedObjectContext { mutating get }

    /**
     It is in charge of the persistant store of application. it is located center of the Core Data Stack.
     It talks to persistent store and makes sure data is saved, loaded and cached.
    */
    var coordinator: NSPersistentStoreCoordinator { mutating get }
}

class NotesCoreDataStack: CoreDataStack {
    let modelName: String = "note"

    lazy var model: NSManagedObjectModel = {
        guard let url = Bundle.main.url(forResource: modelName, withExtension: CoreDataStackHelper.FileExtensionOfCompiledDataModel) else {
            fatalError("unable to create url of managed object model")
        }

        guard let model = NSManagedObjectModel(contentsOf: url) else {
            fatalError("unable to load managed object model")
        }

        return model
    }()

    lazy var coordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        let storeUrl = applicationDocumentsDirectory.appendingPathComponent("\(modelName).\(CoreDataStackHelper.FileExtensionOfSqlite)") // location of the store
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeUrl, options: nil)
        } catch {
            fatalError("unable to create persistant store")
        }
        return coordinator
    }()

    lazy var context: NSManagedObjectContext = {
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType) // all work that do by context is processed in main queue
        context.persistentStoreCoordinator = coordinator // without coordinator, context is useless.
        return context
    }()

    lazy var applicationDocumentsDirectory: URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls.last!
    }()
}
