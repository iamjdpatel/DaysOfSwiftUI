//
//  AstronautView.swift
//  Moonshot
//
//  Created by JD on 01/07/20.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut

    var body: some View {
    
        GeometryReader { geometry in
        
            ScrollView(.vertical) {
            
                VStack {
                
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)

                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)

                }
                
            }
            
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
        
    }
    
}

