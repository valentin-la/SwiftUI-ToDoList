//
//  TabBarView.swift
//  ToDoAppSwiftUI
//
//  Created by valentin laube on 23.10.22.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
       
        HStack(alignment: .bottom) {
            NavigationLink(destination: AddView(), label: {
                Image(systemName: "plus")
                    //.offset(y: -5)
                    .foregroundColor(Color("2"))
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .frame(width: 60, height: 60)
                    .background(Color("5"))
                    .cornerRadius(50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.black.opacity(0.05), lineWidth: 2)
                )
                
            })
        }
        }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
