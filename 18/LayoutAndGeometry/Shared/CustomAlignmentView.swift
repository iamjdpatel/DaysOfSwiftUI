//
//  CustomAlignmentView.swift
//  LayoutAndGeometry
//
//  Created by JD on 03/07/20.
//

import SwiftUI

struct CustomAlignmentView: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@iamjdpatel")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                Image("img_swiftui")
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            VStack {
                Text("Full name:")
                Text("JD Patel")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                    .font(.largeTitle)
            }
        }
    }
}

extension VerticalAlignment {
    struct MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}
