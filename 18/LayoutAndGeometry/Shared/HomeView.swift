//
//  HomeView.swift
//  Shared
//
//  Created by JD on 03/07/20.
//

import SwiftUI

struct HomeView: View {
    @State private var showAlignment: Bool = false
    @State private var showCustomAlignment: Bool = false
    @State private var showInnerOuter: Bool = false
    @State private var showScrollEffect: Bool = false
    @State private var showCoverFlowStyle: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Spacer(minLength: 10)
                Button("Alignment") {
                    self.showAlignment.toggle()
                }.sheet(isPresented: $showAlignment) {
                    AlignmentView()
                }
                
                Button("Custom Alignment") {
                    self.showCustomAlignment.toggle()
                }.sheet(isPresented: $showCustomAlignment) {
                    CustomAlignmentView()
                }

                Button("Inner Outer View") {
                    self.showInnerOuter.toggle()
                }.sheet(isPresented: $showInnerOuter) {
                    InnerOuterView()
                }
                
                Button("ScrollView Effect") {
                    self.showScrollEffect.toggle()
                }.sheet(isPresented: $showScrollEffect) {
                    ScrollEffectView()
                }
                
                Button("CoverFlow-Style View") {
                    self.showCoverFlowStyle.toggle()
                }.sheet(isPresented: $showCoverFlowStyle) {
                    CoverFlowStyleView()
                }
                
                Spacer()
                Text("JD")
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                
            }
            .navigationBarTitle(Text("Layout & Geometry"), displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
