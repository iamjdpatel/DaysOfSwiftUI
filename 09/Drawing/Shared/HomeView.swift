//
//  HomeView.swift
//  Shared
//
//  Created by JD on 01/07/20.
//

import SwiftUI

struct HomeView: View {
    @State private var showShapes: Bool = false
    @State private var showFlower: Bool = false
    @State private var showImagePaint: Bool = false
    @State private var showDrawingGroup: Bool = false
    @State private var showSpecialEffects: Bool = false
    @State private var showAnimatableData: Bool = false
    @State private var showAnimatablePair: Bool = false
    @State private var showSpirograph: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Button("Shapes") {
                    self.showShapes.toggle()
                }.sheet(isPresented: $showShapes) {
                    ShapeView()
                }
                
                Button("Flower") {
                    self.showFlower.toggle()
                }.sheet(isPresented: $showFlower) {
                    FlowerView()
                }
                
                Button("Image Paint") {
                    self.showImagePaint.toggle()
                }.sheet(isPresented: $showImagePaint) {
                    ImagePaintView()
                }
                
                Button("Drawing Group") {
                    self.showDrawingGroup.toggle()
                }.sheet(isPresented: $showDrawingGroup) {
                    DrawingGroupView()
                }
                
                Button("Special Effects") {
                    self.showSpecialEffects.toggle()
                }.sheet(isPresented: $showSpecialEffects) {
                    SpecialEffectsView()
                }
                
                Button("Animatable Data") {
                    self.showAnimatableData.toggle()
                }.sheet(isPresented: $showAnimatableData) {
                    AnimatableDataView()
                }
                
                Button("Animatable Pair") {
                    self.showAnimatablePair.toggle()
                }.sheet(isPresented: $showAnimatablePair) {
                    AnimatablePairView()
                }
                
                Button("Spirograph View") {
                    self.showSpirograph.toggle()
                }.sheet(isPresented: $showSpirograph) {
                    SpirographView()
                }
                Spacer()
                Text("JD")
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                
            }
            .padding(.top, 50)
            .navigationBarTitle(Text("Animations"), displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

