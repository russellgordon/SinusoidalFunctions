//
//  UnitCircleAxes.swift
//  SinusoidalFunctions
//
//  Created by Russell Gordon on 2020-09-05.
//

import SwiftUI

struct UnitCircleAxes: Shape {
        
    func path(in rect: CGRect) -> Path {
        
        // Used for scale on the plane
        let vU = rect.height / 64.0
        
        // One quarter of the vertical space
        let qL = rect.maxY / 4
        
        // One half of the vertical space
        let hL = rect.maxY / 2
        
        // Create an empty path
        var path = Path()
        
        // Draw the horizontal axis
        path.move(to: CGPoint(x: 0 - hL, y: 0))
        path.addLine(to: CGPoint(x: 0 + hL, y: 0))
        
        // Draw the vertical axis
        path.move(to: CGPoint(x: 0, y: 0 - hL))
        path.addLine(to: CGPoint(x: 0, y: 0 + hL))
        
        // Draw horizontal scale
        for i in -2...2 {
            if i != 0 {
                path.move(to: CGPoint(x: 0 - qL * CGFloat(i), y: vU))
                path.addLine(to: CGPoint(x: 0 - qL * CGFloat(i), y: -vU))
            }
        }
        
        // Draw vertical scale
        for i in -2...2 {
            if i != 0 {
                path.move(to: CGPoint(x: -vU, y: 0 - qL * CGFloat(i)))
                path.addLine(to: CGPoint(x: vU, y: 0 - qL * CGFloat(i)))
            }
        }
        
        // Return the transformed figure
        return path.applying(.transformToUnitCirclePlane(rect: rect))
        
    }
}



struct UnitCircleAxes_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ZStack {
            
            GeometryReader { geometry in
                
                // Leading and trailing padding for the axes
                let planeWidth = geometry.size.width - 20.0 * 2.0
                
                UnitCircleAxes()
                    .stroke(Color.black,
                            style: StrokeStyle(lineWidth: 2,
                                               lineCap: .round,
                                               lineJoin: .miter))
                    .frame(width: planeWidth, height: planeWidth)
                    .padding(.horizontal, 20.0)
                
            }
            
            Spacer(minLength: 20.0)
            
        }
        
    }
}
