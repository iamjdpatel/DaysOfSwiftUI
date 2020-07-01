//
//  AnimatingBindingsView.swift
//  Animations
//
//  Created by JD on 01/07/20.
//

import SwiftUI

struct AnimatingBindingsView: View {

    @State private var animationAmount: CGFloat = 1

    var body: some View {
        
        VStack(spacing: 150) {
        
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
        
        }.padding(.all, 30)
        
    }
    
}

struct AnimatingBindingsView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingBindingsView()
    }
}
