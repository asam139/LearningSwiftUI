//
//  ToDoItemCellView.swift
//  ToDoList
//
//  Created by Saul Moreno Abril on 21/08/2019.
//  Copyright © 2019 Saul Moreno Abril. All rights reserved.
//

import SwiftUI

struct ToDoItemCellView: View {
    var title: String = ""
    var createdAt: String = ""

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title).font(.headline)
                Text(createdAt).font(.caption)
            }
        }
    }
}

struct ToDoItemCellView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemCellView(title: "ToDoItem", createdAt: "Today")
    }
}
