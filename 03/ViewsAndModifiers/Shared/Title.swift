//
//  Title.swift
//  ViewsAndModifiers
//
//  Created by JD on 29/06/20.
//

import SwiftUI

struct Title: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .foregroundColor(.white)
            .padding(.all, 5)
            .background(Color.green)
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
    
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}
