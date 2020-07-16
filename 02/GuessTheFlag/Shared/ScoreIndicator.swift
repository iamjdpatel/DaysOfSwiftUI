//
//  ScoreIndicator.swift
//  GuessTheFlag
//
//  Created by JD on 16/07/20.
//

import SwiftUI

struct ScoreIndicator: AnimatableModifier {
    
    var scr: CGFloat = 0
    
    var animatableData: CGFloat {
        get { scr }
        set { scr = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(LabelView(scr: scr))
    }
    
    struct LabelView: View {
        let scr: CGFloat
        var body: some View {
            Text("\(Int(scr * 100))")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
    }
}
