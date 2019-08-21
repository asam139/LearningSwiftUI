//
//  ContentView.swift
//  ToDoList
//
//  Created by Saul Moreno Abril on 21/08/2019.
//  Copyright © 2019 Saul Moreno Abril. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView : View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItem()) var toDoItems: FetchedResults<ToDoItem>

    @State private var newToDoItemTitle = ""

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Whats next?")) {
                    HStack {
                        TextField("New item", text: self.$newToDoItemTitle)
                        Button(action: {
                            let toDoItem = ToDoItem(context: self.managedObjectContext)
                            toDoItem.title = self.newToDoItemTitle
                            toDoItem.createdAt = Date()
                            try? self.managedObjectContext.save()

                            self.newToDoItemTitle = ""
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }.font(.headline)
                    }
                }
                Section(header: Text("To Do's")) {
                    ForEach(self.toDoItems) { toDoItem in
                        ToDoItemCellView(title: toDoItem.title!,
                                         createdAt: "\(toDoItem.createdAt!)")
                    }
                }
            }
            .navigationBarTitle(Text("My List"))
            .navigationBarItems(trailing: EditButton())
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
