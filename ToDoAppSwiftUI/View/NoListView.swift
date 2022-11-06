//
//  NoListView.swift
//  ToDoAppSwiftUI
//
//  Created by valentin laube on 22.10.22.
//

import SwiftUI

struct NoListView: View {
    
    @State var animate: Bool = false
    @State var height: CGFloat = UIScreen.main.bounds.size.height
    
    var body: some View {

        ScrollView{
            VStack(spacing: 20){
                Text("No ToDo's found.")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                    .padding(.top, 40)
                Text("Add Something here 😀")
                    
                
                VStack() {
                    Image(systemName: "arrow.turn.left.down")
                        .offset(y: height / 5)
                        .font(.system(size: 100)).opacity(0.3)
                        .padding(.horizontal, animate ? 30:50)
                        .shadow(color: animate ? Color.green.opacity(0.8) : Color.red.opacity(0.7), radius: animate ? 30:50, x: 0, y: animate ? 50:30)
                            .offset(y: animate ? 80 : 0)
                }
            }.multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform: addAnimation)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(Animation
                .easeInOut(duration: 3.0)
                .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoListView_Previews: PreviewProvider {
    static var previews: some View {
        NoListView()
    }
}
