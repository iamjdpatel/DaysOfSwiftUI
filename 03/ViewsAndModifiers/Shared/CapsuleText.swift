//
//  CapsuleText.swift
//  ViewsAndModifiers
//
//  Created by JD on 29/06/20.
//

import SwiftUI

struct CapsuleText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.subheadline)
            .padding(.all, 8)
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}


struct CapsuleText_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleText(text: "Static Text")
    }
}
