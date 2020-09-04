//
//  CartesianPlane.swift
//  SinusoidalFunctions
//
//  Created by Russell Gordon on 2020-09-04.
//

import SwiftUI

struct CartesianPlane: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        // Create an empty path
        var path = Path()
        
        // Draw the horizontal axis
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))

        // Draw the vertical axis
        path.move(to: CGPoint(x: 0, y: rect.maxY / 2))
        path.addLine(to: CGPoint(x: 0, y: 0 - rect.maxY / 2))
        
        // Return the transformed figure
        return path.applying(.transformToTypicalCartesianPlane(rect: rect))
        
    }
}
