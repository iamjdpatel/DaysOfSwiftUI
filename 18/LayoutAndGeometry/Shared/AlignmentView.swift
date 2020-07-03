//
//  AlignmentView.swift
//  LayoutAndGeometry
//
//  Created by JD on 03/07/20.
//

import SwiftUI

struct AlignmentView: View {
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                ForEach(0..<10) { position in
                    Text("Number \(position)")
                        .alignmentGuide(.leading) { _ in CGFloat(position) * -10 }
                }
            }
            .background(Color.red)
            .frame(width: 400, height: 400)
            .background(Color.blue)
            
            .navigationBarTitle(Text("Alignment"), displayMode: .inline)
            
        }
        
    }
    
}

struct AlignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AlignmentView()
    }
}
