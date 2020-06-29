//
//  Watermark.swift
//  ViewsAndModifiers
//
//  Created by JD on 29/06/20.
//

import SwiftUI

struct Watermark: ViewModifier {
    
    var text: String

    func body(content: Content) -> some View {
        
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.gray)
            
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}
