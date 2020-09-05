//
//  CartesianPlane.swift
//  SinusoidalFunctions
//
//  Created by Russell Gordon on 2020-09-04.
//

import SwiftUI

struct CartesianPlane: View {
    
    var height: CGFloat
    var width: CGFloat
    var padding: CGFloat
    
    var body: some View {
        
        // Leading and trailing padding for the axes
        let planeWidth = width - padding * 2.0
        
        ZStack {

            // Draw the plane as a shape
            Axes(verticalUnit: height / 64.0,
                 horizontalUnit: planeWidth / 8.0)
                .stroke(Color.black, style: StrokeStyle(lineWidth: 2,
                                                        lineCap: .round,
                                                        lineJoin: .miter))
                .padding(.horizontal, padding)
            
            // Labels for the axes
            Labels(planeWidth: planeWidth, planeHeight: height)

        }
        
    }
}

struct CartesianPlane_Previews: PreviewProvider {
    static var previews: some View {
        
        GeometryReader { geometry in
            CartesianPlane(height: geometry.size.height,
                           width: geometry.size.width,
                           padding: 20)
        }
        
    }
}
