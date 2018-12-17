//
//  ViewController.swift
//  RBCoreDataStack
//
//  Created by Rahmi on 13.12.2018.
//  Copyright © 2018 rbozdag. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let mo = NoteCollectionEntity.createNewMo(context: AppDelegate.shared.noteDataStack.context)
        mo?.title = "Rahmi Test"
        mo?.colorOfFlag = 0xff0000
        try? AppDelegate.shared.noteDataStack.context.save()
        try! mo?.managedObjectContext?.save()
        AppDelegate.shared.noteDataStack.context.perform {
            let fetchRequest: NSFetchRequest<NoteCollectionEntity> = NoteCollectionEntity.fetchRequest()
            let data = try? fetchRequest.execute()
            print(data)
        }
    }


}

