//
//  SwiftUIView.swift
//  SinusoidalFunctions
//
//  Created by Russell Gordon on 2020-09-05.
//

import SwiftUI

struct UnitCirclePlane: View {
    
    var height: CGFloat
    var width: CGFloat
    var padding: CGFloat
    
    var body: some View {
        
        // Leading and trailing padding for the axes
        let planeWidth = width - padding * 2.0
        
        ZStack {

            // Draw the plane as a shape
            UnitCircleAxes(verticalUnit: height / 64.0,
                 horizontalUnit: planeWidth / 8.0)
                .stroke(Color.primary, style: StrokeStyle(lineWidth: 2,
                                                        lineCap: .round,
                                                        lineJoin: .miter))
                .padding(.horizontal, padding)

            // Labels for the axes
//            Labels(planeWidth: planeWidth, planeHeight: height)

        }

    }
}

struct UnitCirclePlane_Previews: PreviewProvider {
    
    static var previews: some View {
        
        GeometryReader { geometry in
            UnitCirclePlane(height: geometry.size.width,
                           width: geometry.size.width,
                           padding: 20)
                .frame(width: geometry.size.width, height: geometry.size.width)
        }
        .padding(.horizontal, 20.0)

        
    }
    
}
