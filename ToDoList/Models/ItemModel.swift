//
//  ItemModel.swift
//  ToDoList
//
//  Created by Martí Espinosa Farran on 4/5/24.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
