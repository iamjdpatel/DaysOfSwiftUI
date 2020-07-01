//
//  ContentView.swift
//  Shared
//
//  Created by JD on 30/06/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var defaultAnimationAmount: CGFloat = 1
    @State private var easeInOutAnimationAmount: CGFloat = 1
    @State private var animationAmount: CGFloat = 1

    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 30) {
                
                Button("Default") {
                    self.defaultAnimationAmount += 1
                }
                .padding(50)
                .background(Color.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .scaleEffect(defaultAnimationAmount)
                .animation(.default)
                .blur(radius: (defaultAnimationAmount - 1) * 3)
                
                Button("Custom") {
                    self.easeInOutAnimationAmount += 1
                }
                .padding(40)
                .background(Color.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.red)
                        .scaleEffect(easeInOutAnimationAmount)
                        .opacity(Double(2 - easeInOutAnimationAmount))
                        .animation(
                            Animation.easeOut(duration: 1)
                                .repeatForever(autoreverses: false)
                        )
                )
                
                Divider()
                
                Stepper("Scale amount", value: $animationAmount.animation(
                    Animation.easeInOut(duration: 1)
                        .repeatCount(3, autoreverses: true)
                ), in: 1...10)
                
                Button("Tap Me") {
                    self.animationAmount += 1
                }
                .padding(40)
                .background(Color.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .scaleEffect(animationAmount)
                
            }
            .navigationBarTitle(Text("Animations"), displayMode: .inline)
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
