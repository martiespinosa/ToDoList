//
//  ListView.swift
//  ToDoList
//
//  Created by Martí Espinosa Farran on 4/5/24.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "First", isCompleted: false),
        ItemModel(title: "Second", isCompleted: false),
        ItemModel(title: "Third", isCompleted: false),
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("To-Do List 📝")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: AddView())
            }
        }
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
}
