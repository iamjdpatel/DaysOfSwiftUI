//
//  ImagePaintView.swift
//  Drawing
//
//  Created by JD on 02/07/20.
//

import SwiftUI

struct ImagePaintView: View {
    
    var body: some View {
        
        VStack(spacing: 80) {
            
            Text("Image Paint")
                .frame(width: 250, height: 250)
                .border(ImagePaint(image: Image("img_swiftui"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1), width: 30)
            
            Capsule()
                .strokeBorder(ImagePaint(image: Image("img_swiftui"), scale: 0.1), lineWidth: 20)
                .frame(width: 250, height: 150)
        }
        
    }
    
}

struct ImagePaintView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePaintView()
            .preferredColorScheme(.dark)
    }
}

