//
//  ToDoAppSwiftUIApp.swift
//  ToDoAppSwiftUI
//
//  Created by valentin laube on 20.10.22.
//

import SwiftUI

@main
struct ToDoAppSwiftUIApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
// available to everyone
            .environmentObject(listViewModel)
        }
    }
}
