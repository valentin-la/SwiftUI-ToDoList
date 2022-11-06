//
//  ListRawView.swift
//  ToDoAppSwiftUI
//
//  Created by valentin laube on 22.10.22.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
                .strikethrough(item.isCompleted ? true : false)
            Spacer()
            Text(item.priority)
        }.font(.title2)
            .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListRowView(item: ItemModel(Title: "Calling Doctor", IsCompleted: false, Priority: "🔥🔥"))
        }
    }
}
