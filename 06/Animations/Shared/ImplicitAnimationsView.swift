//
//  ImplicitAnimationsView.swift
//  Animations
//
//  Created by JD on 30/06/20.
//

import SwiftUI

struct ImplicitAnimationsView: View {
    
    @State private var animationAmount: CGFloat = 1

    var body: some View {
        Button("Tap Me") {
            self.animationAmount += 1
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        .animation(.default)
        .blur(radius: (animationAmount - 1) * 3)

    }
    
}

struct ImplicitAnimationsView_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitAnimationsView()
    }
}
