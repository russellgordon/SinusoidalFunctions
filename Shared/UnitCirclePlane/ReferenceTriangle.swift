//
//  ReferenceTriangle.swift
//  SinusoidalFunctions (iOS)
//
//  Created by Russell Gordon on 2020-09-05.
//

import SwiftUI

struct ReferenceTriangle: Shape {
    
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
        
        // Start with triangle at the origin
        path.move(to: CGPoint(x: 0, y: p.c * qL))
        
        // Move to the point on unit circle
        path.addLine(to: CGPoint(x: p.a * cos(angle.inRadians()) * qL, y: p.a * sin(angle.inRadians()) * qL + p.c * qL))

        // Move to point on horizontal axis
        path.addLine(to: CGPoint(x: p.a * cos(angle.inRadians()) * qL, y: p.c * qL))
        
        // Back to origin
        path.addLine(to: CGPoint(x: 0, y: p.c * qL))
        
        // Return the entire path of the function
        return path
            .applying(.transformToUnitCirclePlane(rect: rect))
    }
    

}

struct ReferenceTriangle_Previews: PreviewProvider {
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

                    }
                }
                
                Spacer(minLength: geometry.size.height / 3 * 2)

            }
        }

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
                        UnitCircle(parameters: TransformationParameters(a: 1,
                                                                        d: 0,
                                                                        k: 1,
                                                                        c: 1))
                            .stroke(Color.primary, lineWidth: 2.0)
                            .padding(.horizontal, padding)
                        
                        // The reference triangle
                        ReferenceTriangle(parameters: TransformationParameters(a: 1,
                                                                               d: 0,
                                                                               k: 1,
                                                                               c: 1),
                                          angle: 45)
                            .stroke(Color.primary,
                                    style: StrokeStyle(lineWidth: 2,
                                                       lineCap: .square,
                                                       lineJoin: .round))
                            .padding(.horizontal, padding)

                    }
                }
                
                Spacer(minLength: geometry.size.height / 3 * 2)

            }
        }

    }
}


