//
//  AdjacentSide.swift
//  SinusoidalFunctions (iOS)
//
//  Created by Russell Gordon on 2020-09-05.
//

import SwiftUI

struct AdjacentSide: Shape {
    
    var angle: Degrees
        
    func path(in rect: CGRect) -> Path {
        
        // One quarter of the vertical space
        let qL = rect.maxY / 4
        
        // Create an empty path
        var path = Path()
        
        // Start at origin
        path.move(to: CGPoint(x: 0, y: 0))

        // End at point on horizontal axis
        path.addLine(to: CGPoint(x: cos(angle.inRadians()) * qL, y: 0))
        
        // Return the entire path of the function
        return path
            .applying(.transformToUnitCirclePlane(rect: rect))
    }
    

}

struct AdjacentSide_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            VStack {
                
                GeometryReader { geometry in
                    ZStack {
                        
                        let padding: CGFloat = 20

                        // The plane
                        UnitCirclePlane(height: geometry.size.height,
                                        width: geometry.size.width,
                                        padding: padding)
                        
                        // The graph
                        UnitCircle()
                            .stroke(Color.primary, lineWidth: 2.0)
                            .padding(.horizontal, padding)
                        
                        // The reference triangle
                        ReferenceTriangle(angle: 45)
                            .stroke(Color.primary,
                                    style: StrokeStyle(lineWidth: 2,
                                                       lineCap: .square,
                                                       lineJoin: .round))
                            .padding(.horizontal, padding)
                        
                        // The opposide side length
                        AdjacentSide(angle: 45)
                            .stroke(Color.green,
                                    style: StrokeStyle(lineWidth: 2,
                                                       lineCap: .square))
                            .padding(.horizontal, padding)

                    }
                }
                
                Spacer(minLength: geometry.size.height / 3 * 2)

            }
        }
    }
}



