//
//  ListView.swift
//  ToDoAppSwiftUI
//
//  Created by valentin laube on 22.10.22.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listviewmodel: ListViewModel
    
    var body: some View {
        VStack {
            ZStack{
                if listviewmodel.items.isEmpty {
                    NoListView()
                        .transition(AnyTransition.opacity.animation(.easeIn))
                } else {
                    List{
                        ForEach(listviewmodel.items) { item in
                            ListRowView(item: item)
                                .onTapGesture {
                                    withAnimation(.easeOut(duration: 0.5)){
                                        listviewmodel.update(item: item)
                                    }
                                }
                            //.listRowBackground(Color.white)
                        }
                        .onDelete(perform: listviewmodel.deleteItem)
                        .onMove(perform: listviewmodel.moveItem)
                    }
                    //.background(.pink)
                    .scrollContentBackground(.hidden)
                }
            }
            
            .navigationTitle("Items")
            //.navigationBarTitleDisplayMode(.inline)
            .toolbar { if !listviewmodel.items.isEmpty {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton() }
            }
            }
            Spacer()
            TabBarView()
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color("background").opacity(0.6), Color.black.opacity(0.05)]), startPoint: .topLeading, endPoint: .bottomTrailing))
        //.background(Color.black.opacity(0.05))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }.environmentObject(ListViewModel())
    }
}
