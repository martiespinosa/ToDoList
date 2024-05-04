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
                .foregroundStyle(item.isCompleted ? Color.accentColor : .primary)
            Text(item.title)
            Spacer()
        }
        .font(.title3)
    }
}

#Preview {
    Group {
        ListRowView(item: ItemModel(title: "Sample title", isCompleted: false))
        ListRowView(item: ItemModel(title: "Sample title", isCompleted: true))
    }
}
