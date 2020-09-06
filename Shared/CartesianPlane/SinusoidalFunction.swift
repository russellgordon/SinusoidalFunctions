//
//  SinusoidalFunction.swift
//  SinusoidalFunctions
//
//  Created by Russell Gordon on 2020-09-04.
//

import SwiftUI

struct SinusoidalFunction: Shape {
    
    let p: TransformationParameters
    let angle: CGFloat
    let functionType: SinusoidalType
    
    init(parameters p: TransformationParameters,
         angle: CGFloat,
         functionType: SinusoidalType) {
        
        self.p = p
        self.angle = angle
        self.functionType = functionType
        
    }
    
    func path(in rect: CGRect) -> Path {
        
        // Create an empty path
        var path = Path()
        
        // Build the path of the sinsoidal function
        var firstX: CGFloat = 0.0
        var lastX: CGFloat = 0.0
        for theta in stride(from: p.d.inRadians(),
                            through: angle.inRadians() + p.d.inRadians(),
                            by: 0.01) {
                        
            // Determine next position
            let x = theta
            
            var y: CGFloat = 0.0
            if functionType == .sine {
                y = p.a * sin((x - p.d.inRadians()) / p.k) + p.c
            } else {
                y = p.a * cos((x - p.d.inRadians()) / p.k) + p.c
            }
            
            // Add to the path
            if theta == p.d.inRadians() {
                
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
        path.addLine(to: CGPoint(x: lastX, y: p.c))
        
        // Draw a line back to the starting X position for cosine, so the fill is correct
        if functionType == .cosine {
            path.addLine(to: CGPoint(x: firstX, y: p.c))
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
                SinusoidalFunction(parameters: TransformationParameters(a: 1,
                                                                        d: 90,
                                                                        k: 1.5,
                                                                        c: 0.5),
                                   angle: 720,
                                   functionType: .sine)
                    .stroke(Color.red, lineWidth: 2.0)
                    .padding(.horizontal, padding)
                
            }
        }
    }
}
