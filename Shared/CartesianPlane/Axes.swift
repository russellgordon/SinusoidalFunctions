//
//  CartesianPlane.swift
//  SinusoidalFunctions
//
//  Created by Russell Gordon on 2020-09-04.
//

import SwiftUI

struct Axes: Shape {
    
    // Used for positioning scale and text on the plane
    let vU: CGFloat
    let hU: CGFloat
    
    init(verticalUnit: CGFloat, horizontalUnit: CGFloat) {
        self.vU = verticalUnit
        self.hU = horizontalUnit
    }
    
    func path(in rect: CGRect) -> Path {
        
        // One quarter of the height
        let vUQuarter = rect.size.height / 4.0
        
        // Create an empty path
        var path = Path()
        
        // Draw the horizontal axis
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        
        // Draw horizontal scale
        for i in 1...8 {
            path.move(to: CGPoint(x: CGFloat(i) * hU, y: vU))
            path.addLine(to: CGPoint(x: CGFloat(i) * hU, y: -vU))
        }
        
        // Draw the vertical axis
        path.move(to: CGPoint(x: 0, y: rect.maxY / 2))
        path.addLine(to: CGPoint(x: 0, y: 0 - rect.maxY / 2))
        
        // Draw vertical scale
        for i in 1...2 {
            
            // Above the axis
            path.move(to: CGPoint(x: 0, y: CGFloat(i) * vUQuarter))
            path.addLine(to: CGPoint(x: vU, y: CGFloat(i) * vUQuarter))
            
            // Below the axis
            path.move(to: CGPoint(x: 0, y: CGFloat(i) * -vUQuarter))
            path.addLine(to: CGPoint(x: vU, y: CGFloat(i) * -vUQuarter))
            
        }
        
        // Return the transformed figure
        return path.applying(.transformToTypicalCartesianPlane(rect: rect))
        
    }
}



struct Axes_Previews: PreviewProvider {
        
    static var previews: some View {
        
        ZStack {
            
            GeometryReader { geometry in

                // Leading and trailing padding for the axes
                let planeWidth = geometry.size.width - 20.0 * 2.0

                Axes(verticalUnit: geometry.size.height / 64.0,
                     horizontalUnit: planeWidth / 8.0)
                    .stroke(Color.black, style: StrokeStyle(lineWidth: 2,
                                                            lineCap: .round,
                                                            lineJoin: .miter))
                    .padding(.horizontal, 20.0)

            }
            
            Spacer(minLength: 20.0)

        }

    }
}
