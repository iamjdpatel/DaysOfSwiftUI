//
//  ScrollEffectView.swift
//  LayoutAndGeometry
//
//  Created by JD on 04/07/20.
//

import SwiftUI

struct ScrollEffectView: View {
    
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        NavigationView {
            GeometryReader { fullView in
                ScrollView(.vertical) {
                    ForEach(0..<50) { index in
                        GeometryReader { geo in
                            Text("Row #\(index)")
                                .font(.title)
                                .frame(width: fullView.size.width)
                                .background(self.colors[index % 7])
                                .cornerRadius(10)
                                .rotation3DEffect(.degrees(Double(geo.frame(in: .global).minY - fullView.size.height / 2) / 5), axis: (x: 0, y: 1, z: 0))
                        }
                        .frame(height: 40)
                    }
                }
            }
            .navigationBarTitle(Text("ScrollView Effect"), displayMode: .inline)
        }
    }
}
