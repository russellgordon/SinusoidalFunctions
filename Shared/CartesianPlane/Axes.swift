//
//  CartesianPlane.swift
//  SinusoidalFunctions
//
//  Created by Russell Gordon on 2020-09-04.
//

import SwiftUI

struct Axes: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        // Used for scale on the plane
        let vU: CGFloat = rect.height / 64.0
        let hU: CGFloat = rect.width / 8.0

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

                Axes()
                    .stroke(Color.black,
                            style: StrokeStyle(lineWidth: 2,
                                               lineCap: .round,
                                               lineJoin: .miter))
                    .padding(.horizontal, 20.0)

            }
            
            Spacer(minLength: 20.0)

        }

    }
}
