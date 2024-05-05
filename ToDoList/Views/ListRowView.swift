//
//  ListRowView.swift
//  ToDoList
//
//  Created by Martí Espinosa Farran on 4/5/24.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .font(.title2)
                .foregroundStyle(item.isCompleted ? Color.accentColor : .primary)
            
            Text(item.title)
                .font(.title3)
                .strikethrough(item.isCompleted)
            
            Spacer()
        }
    }
}

#Preview {
    Group {
        ListRowView(item: ItemModel(title: "Sample title", isCompleted: false))
        ListRowView(item: ItemModel(title: "Sample title", isCompleted: true))
    }
}
