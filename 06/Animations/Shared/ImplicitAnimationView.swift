//
//  ImplicitAnimationView.swift
//  Animations
//
//  Created by JD on 01/07/20.
//

import SwiftUI

struct ImplicitAnimationView: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        Button("Tap Me") {
            // self.animationAmount += 1
        }
        .padding(40)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color.red)
                .scaleEffect(animationAmount)
                .opacity(Double(2 - animationAmount))
                .animation(
                    Animation.easeOut(duration: 1)
                        .repeatForever(autoreverses: false)
                )
        )
        .onAppear {
            self.animationAmount = 2
        }
    }
}

struct ImplicitAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitAnimationView()
    }
}
