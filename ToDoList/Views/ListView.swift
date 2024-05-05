//
//  ListView.swift
//  ToDoList
//
//  Created by Martí Espinosa Farran on 4/5/24.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var vm: ListViewModel
    
    var body: some View {
        VStack {
            if vm.items.isEmpty {
                Spacer()
                noItems
                Spacer()
            } else {
                itemsList
            }
        }
        .navigationTitle("To-Do List 📋")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
                    .disabled(vm.items.isEmpty)
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
    .environmentObject(ListViewModel())
}

extension ListView {
    var noItems: some View {
        ContentUnavailableView(
            "You're all done",
            systemImage: "checkmark",
            description: Text("Tap Add button if you have to-dos")
        )
    }
    
    var itemsList: some View {
        List {
            ForEach(vm.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear(duration: 0.2)) {
                            vm.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: vm.deleteItem)
            .onMove(perform: vm.moveItem)
        }
        .padding(.top)
        .listStyle(PlainListStyle())
    }
}
