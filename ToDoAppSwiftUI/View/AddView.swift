//
//  AddView.swift
//  ToDoAppSwiftUI
//
//  Created by valentin laube on 22.10.22.
//

import SwiftUI


struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var listviewmodel: ListViewModel
    
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    @State var priority = ""
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type something here ...", text: $textFieldText)
                    //.foregroundColor(Color("6"))
                    .keyboardType(.default)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color("backgroundTextfield"))
                    .cornerRadius(10)
                    
                Divider()
                
                VStack {
                    Text("Add a Priority")
                        .frame(
                            maxWidth: .infinity,
                            alignment: .leading)
                        .opacity(0.5)
                    Picker("Color Scheme", selection: $priority) {
                            Text("🔥").tag("🔥")
                            Text("🔥🔥").tag("🔥🔥")
                            Text("🔥🔥🔥").tag("🔥🔥🔥")
                            Text("None").tag("")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Divider()
                
                Button(action: saveButtonTapped, label: {
                    Text("Save")
                        .foregroundColor(Color("2"))
                        .font(.headline)
                        .frame(height:55)
                        .frame(maxWidth: .infinity)
                        .background(Color("5"))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black.opacity(0.05), lineWidth: 2)
                    )
                })
            }.padding(16)
        }.navigationTitle("Add an Item")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Your todo item should contain atleast 3 characters 😟"))
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color("background").opacity(0.6), Color.black.opacity(0.05)]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
    
    func saveButtonTapped() {
        if textFieldText.count > 3 {
            listviewmodel.addItem(title: textFieldText, priority: priority)
            presentationMode.wrappedValue.dismiss()
        } else {
            showAlert.toggle()
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
    }
}
