//
//  HomeView.swift
//  Shared
//
//  Created by JD on 29/06/20.
//

import SwiftUI

struct HomeView: View {
    @State private var useRedText = true
    @State var showGridView = false
    private let viewAsProperty = Text("View as Property")

    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Text("maxWidth/maxHeight to Infinity")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.green)
                Text("Why modifier order matters")
                    .padding()
                    .background(Color.red)
                    .padding()
                    .background(Color.blue)
                    .padding()
                    .background(Color.green)
                    .padding()
                    .background(Color.yellow)
                Button("Hello World") {
                    print(type(of: self.body))
                }
                .frame(width: 180, height: 60)
                .background(Color.yellow)
                Button("Click to check Conditional modifiers") {
                    self.useRedText.toggle()
                }
                .foregroundColor(useRedText ? .red : .green)
                VStack {
                    Text("This is")
                    Text("Environment")
                    Text("modifier")
                }
                .font(.subheadline)
                .foregroundColor(.blue)
                viewAsProperty
                    .foregroundColor(.purple)
                CapsuleText(text: "View composition")
                Text("Custom Modifiers")
                    .titleStyle()
                Color.pink
                    .frame(width: 200, height: 60)
                    .watermarked(with: "Watermark")
                Text("JD")
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }.padding(.all, 10)
            
            .sheet(isPresented: $showGridView) { GridView() }
            .navigationBarTitle(Text("Views & Modifiers"), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.showGridView.toggle()
                }) {
                    Image(systemName: "square.grid.3x3")
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

