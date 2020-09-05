//
//  UnitCircleIllustration.swift
//  SinusoidalFunctions (iOS)
//
//  Created by Russell Gordon on 2020-09-05.
//

import SwiftUI

struct UnitCircleIllustration: View {
    
    var angle: Degrees
    var type: SinusoidalType
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                GeometryReader { geometry in
                    ZStack {
                        
                        let padding: CGFloat = 20

                        // The plane
                        UnitCirclePlane(height: geometry.size.height,
                                        width: geometry.size.width,
                                        padding: padding)

                        // The circle
                        UnitCircle(c: 0)
                            .stroke(Color.primary, lineWidth: 2.0)
                            .padding(.horizontal, padding)
                        
                        // The reference triangle
                        ReferenceTriangle(angle: angle, c: 0)
                            .stroke(Color.primary,
                                    style: StrokeStyle(lineWidth: 2,
                                                       lineCap: .square,
                                                       lineJoin: .round))
                            .padding(.horizontal, padding)

                        // Show appropriate side
                        if type == .sine {
                            
                            // The opposide side length
                            OppositeSide(angle: 45, c: 0)
                                .stroke(Color.red,
                                        style: StrokeStyle(lineWidth: 2,
                                                           lineCap: .square))
                                .padding(.horizontal, padding)
                            
                        } else {
                            
                            // The adjacent side length
                            AdjacentSide(angle: 45)
                                .stroke(Color.green,
                                        style: StrokeStyle(lineWidth: 2,
                                                           lineCap: .square))
                                .padding(.horizontal, padding)
                        }
                        
                                                
                    }
                }
                
                Spacer(minLength: geometry.size.height / 3 * 2)

            }
        }

    }
}

struct UnitCircleIllustration_Previews: PreviewProvider {
    static var previews: some View {
        UnitCircleIllustration(angle: 45, type: .sine)
        UnitCircleIllustration(angle: 45, type: .cosine)
    }
}
