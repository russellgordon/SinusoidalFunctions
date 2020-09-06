//
//  SinusoidalFunction.swift
//  SinusoidalFunctions
//
//  Created by Russell Gordon on 2020-09-04.
//

import SwiftUI

struct SinusoidalFunction: Shape {
    
    let a: CGFloat
    let d: CGFloat
    let k: CGFloat
    let c: CGFloat
    let angle: CGFloat
    let type: SinusoidalType
    
    func path(in rect: CGRect) -> Path {
        
        // Create an empty path
        var path = Path()
        
        // Build the path of the sinsoidal function
        var firstX: CGFloat = 0.0
        var lastX: CGFloat = 0.0
        for theta in stride(from: d.inRadians(), through: angle.inRadians() + d.inRadians(), by: 0.01) {
                        
            // Determine next position
            let x = theta
            
            var y: CGFloat = 0.0
            if type == .sine {
                y = a * sin((x - d.inRadians()) / k) + c
            } else {
                y = a * cos((x - d.inRadians()) / k) + c
            }
            
            // Add to the path
            if theta == d.inRadians() {
                
                // Start of curve
                path.move(to: CGPoint(x: x, y: y))
                
                // Save first horizontal position
                firstX = x
                
            } else {

                // Between start and end
                path.addLine(to: CGPoint(x: x, y: y))
                
                // Save last horizontal position
                lastX = x
                
            }
                        
        }
        
        // Draw a line to sinusoidal axis
        // This allows a fill and is connected to the unit circle
        path.addLine(to: CGPoint(x: lastX, y: c))
        
        // Draw a line back to the starting X position for cosine, so the fill is correct
        if type == .cosine {
            path.addLine(to: CGPoint(x: firstX, y: c))
        }
        
        // Define horizontal length of one cycle of the graph
        let period = rect.size.width / (.pi * 2 * 2)
        
        // Define scaling based on size of the rect
        let scaleFactor = CGAffineTransform(scaleX: period,
                                            y: rect.size.height / 4.0)
        
        // Return the entire path of the function
        return path
            .applying(scaleFactor)
            .applying(.transformToTypicalCartesianPlane(rect: rect))
    }
    

}

struct SinusoidalFunction_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            ZStack {
                
                let padding: CGFloat = 20

                // The plane
                CartesianPlane(height: geometry.size.height,
                               width: geometry.size.width,
                               padding: padding)
                
                // The graph
                SinusoidalFunction(a: 1,
                                   d: 90,
                                   k: 1,
                                   c: 0,
                                   angle: 720,
                                   type: .sine)
                    .stroke(Color.red, lineWidth: 2.0)
                    .padding(.horizontal, padding)
                
            }
        }
    }
}
