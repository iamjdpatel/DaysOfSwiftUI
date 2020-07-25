//
//  CoverFlowStyleView.swift
//  LayoutAndGeometry
//
//  Created by JD on 04/07/20.
//

import SwiftUI

struct CoverFlowStyleView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    var body: some View {
        NavigationView {
            GeometryReader { fullView in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<50) { index in
                            GeometryReader { geo in
                                Rectangle()
                                    .fill(self.colors[index % 7])
                                    .frame(height: 150)
                                    .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).midX - fullView.size.width / 2) / 10), axis: (x: 0, y: 1, z: 0))
                            }
                            .frame(width: 150)
                        }
                    }
                    .padding(.vertical, (fullView.size.height - 150) / 2)
                }
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle(Text("CoverFlow-Style View"), displayMode: .inline)
        }
    }
}
