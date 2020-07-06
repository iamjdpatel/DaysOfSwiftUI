//
//  HomeView.swift
//  Shared
//
//  Created by JD on 30/06/20.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showImplicitAnimation: Bool = false
    @State private var showAnimatingBindings: Bool = false
    @State private var showExplicitAnimation: Bool = false
    @State private var showAnimationStack: Bool = false
    @State private var showAnimatingGestures: Bool = false
    @State private var showTransitions: Bool = false


    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 30) {
                
                Spacer()
                
                Button("Implicit Animation") {
                    self.showImplicitAnimation.toggle()
                }.sheet(isPresented: $showImplicitAnimation) {
                    ImplicitAnimationView()
                }
                
                Button("Animating Binding") {
                    self.showAnimatingBindings.toggle()
                }.sheet(isPresented: $showAnimatingBindings) {
                    AnimatingBindingsView()
                }
                
                Button("Explicit Animation") {
                    self.showExplicitAnimation.toggle()
                }.sheet(isPresented: $showExplicitAnimation) {
                    ExplicitAnimationView()
                }

                Button("Animation Stack") {
                    self.showAnimationStack.toggle()
                }.sheet(isPresented: $showAnimationStack) {
                    AnimationStackView()
                }
                
                Button("Animating Gestures") {
                    self.showAnimatingGestures.toggle()
                }.sheet(isPresented: $showAnimatingGestures) {
                    AnimatingGesturesView()
                }
                
                Button("Transitions") {
                    self.showTransitions.toggle()
                }.sheet(isPresented: $showTransitions) {
                    TransitionsView()
                }
                
                Spacer()
                
                Text("JD")
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                
            }
            
            .navigationBarTitle(Text("Animations"), displayMode: .inline)
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
