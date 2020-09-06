//
//  OppositeSide.swift
//  SinusoidalFunctions (iOS)
//
//  Created by Russell Gordon on 2020-09-05.
//

import SwiftUI

struct OppositeSide: Shape {
    
    var p: TransformationParameters
    var angle: Degrees
    
    init(parameters p: TransformationParameters,
         angle: Degrees) {
        self.p = p
        self.angle = angle
    }
        
    func path(in rect: CGRect) -> Path {
        
        // One quarter of the vertical space
        let qL = rect.maxY / 4
        
        // Create an empty path
        var path = Path()
        
        // Start with point on unit circle
        path.move(to: CGPoint(x: p.a * cos(angle.inRadians()) * qL, y: p.a * sin(angle.inRadians()) * qL + p.c * qL))

        // End at point on horizontal axis
        path.addLine(to: CGPoint(x: p.a * cos(angle.inRadians()) * qL, y: 0 + p.c * qL))
        
        // Return the entire path of the function
        return path
            .applying(.transformToUnitCirclePlane(rect: rect))
    }
    

}

struct OppositeSide_Previews: PreviewProvider {
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
                        UnitCircle(parameters: TransformationParameters.defaultValues)
                            .stroke(Color.primary, lineWidth: 2.0)
                            .padding(.horizontal, padding)
                        
                        // The reference triangle
                        ReferenceTriangle(parameters: TransformationParameters.defaultValues,
                                          angle: 45)
                            .stroke(Color.primary,
                                    style: StrokeStyle(lineWidth: 2,
                                                       lineCap: .square,
                                                       lineJoin: .round))
                            .padding(.horizontal, padding)
                        
                        // The opposide side length
                        OppositeSide(parameters: TransformationParameters.defaultValues,
                                     angle: 45)
                            .stroke(Color.red,
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



