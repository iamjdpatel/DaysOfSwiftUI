//
//  ContentView.swift
//  Shared
//
//  Created by JD on 01/07/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showShapes: Bool = false
    @State private var showFlower: Bool = false
    @State private var showImagePaint: Bool = false

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
                
            }
            .navigationBarTitle(Text("Animations"), displayMode: .inline)
            
        }
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

