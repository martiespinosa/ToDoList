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
                ContentUnavailableView(
                    "You're all done",
                    systemImage: "checkmark",
                    description: Text("Tap Add button if you have to-dos")
                )
                Spacer()
            } else {
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
    .environmentObject(ListViewModel())
}
