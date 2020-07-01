//
//  AnimationStackView.swift
//  Animations
//
//  Created by JD on 01/07/20.
//

import SwiftUI

struct AnimationStackView: View {
  
    @State private var enabled = false

    var body: some View {
        
        Button("Tap Me") {
            self.enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? Color.blue : Color.red)
        .animation(nil)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1))

    }
    
}
