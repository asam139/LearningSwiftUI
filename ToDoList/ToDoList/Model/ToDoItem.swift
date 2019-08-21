//
//  ToDoList.swift
//  ToDoList
//
//  Created by Saul Moreno Abril on 21/08/2019.
//  Copyright © 2019 Saul Moreno Abril. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI

public class ToDoItem: NSManagedObject, Identifiable {
    @NSManaged var createdAt: Date?
    @NSManaged var title: String?
}

extension ToDoItem {
    static func getAllToDoItem() -> NSFetchRequest<ToDoItem> {
        let request: NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest() as! NSFetchRequest<ToDoItem>
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        return request
    }
}
