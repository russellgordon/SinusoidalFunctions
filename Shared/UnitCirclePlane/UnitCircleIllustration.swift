//
//  UnitCircleIllustration.swift
//  SinusoidalFunctions (iOS)
//
//  Created by Russell Gordon on 2020-09-05.
//

import SwiftUI

struct UnitCircleIllustration: View {
    
    let parameters: TransformationParameters
    let angle: Degrees
    let functionType: SinusoidalType
    let padding: CGFloat
    
    var body: some View {

        GeometryReader { geometry in
            
            // Show the plane, and then the circle on top of it
            ZStack {
                
                // The plane
                UnitCirclePlane(height: geometry.size.height,
                                width: geometry.size.width,
                                padding: padding)

                // The unit circle for the original function
                UnitCircle(parameters: TransformationParameters.defaultValues)
                    .stroke(Color.primary, lineWidth: 1.0)
                    .padding(.horizontal, padding)

                // The unit circle for the transformed function
                UnitCircle(parameters: parameters)
                    .stroke(Color.primary, lineWidth: 2.0)
                    .padding(.horizontal, padding)

                // The reference triangle for original function
                ReferenceTriangle(parameters: TransformationParameters.defaultValues,
                                  angle: angle)
                    .stroke(Color.primary,
                            style: StrokeStyle(lineWidth: 1,
                                               lineCap: .square,
                                               lineJoin: .round))
                    .padding(.horizontal, padding)

                // The reference triangle for transformed function
                ReferenceTriangle(parameters: parameters,
                                  angle: angle)
                    .stroke(Color.primary,
                            style: StrokeStyle(lineWidth: 2,
                                               lineCap: .square,
                                               lineJoin: .round))
                    .padding(.horizontal, padding)

                if functionType == .sine {

                    // The opposite side length
                    OppositeSide(parameters: TransformationParameters.defaultValues,
                                 angle: angle)
                        .stroke(Color.gray,
                                style: StrokeStyle(lineWidth: 2,
                                                   lineCap: .square))
                        .padding(.horizontal, padding)

                    // The opposite side length for transformed function
                    OppositeSide(parameters: parameters,
                                 angle: angle)
                        .stroke(Color.red,
                                style: StrokeStyle(lineWidth: 2,
                                                   lineCap: .square))
                        .padding(.horizontal, padding)

                } else {

                    // The adjacent side length
                    AdjacentSide(parameters: TransformationParameters.defaultValues,
                                 angle: angle)
                        .stroke(Color.gray,
                                style: StrokeStyle(lineWidth: 2,
                                                   lineCap: .square))
                        .padding(.horizontal, padding)

                    // The adjacent side length for the transformed function
                    AdjacentSide(parameters: parameters,
                                 angle: angle)
                        .stroke(Color.green,
                                style: StrokeStyle(lineWidth: 2,
                                                   lineCap: .square))
                        .padding(.horizontal, padding)

                }
                

            }
            
        }
        .padding(.all, 0)
        .clipped()

    }
}

struct UnitCircleIllustration_Previews: PreviewProvider {
    static var previews: some View {
        
        GeometryReader { geometry in
            VStack {
                
                UnitCircleIllustration(parameters: TransformationParameters(a: 1.5,
                                                                            d: 0,
                                                                            k: 1,
                                                                            c: 0.5),
                                       angle: 45,
                                       functionType: .sine,
                                       padding: 20)
                
                Spacer(minLength: geometry.size.height / 3 * 2)
                
            }
            
        }
        
        GeometryReader { geometry in
            VStack {
                
                UnitCircleIllustration(parameters: TransformationParameters(a: 1.5,
                                                                            d: 0,
                                                                            k: 1,
                                                                            c: 0.5),
                                       angle: 45,
                                       functionType: .cosine,
                                       padding: 20)

                Spacer(minLength: geometry.size.height / 3 * 2)
                
            }
            
        }
        
    }
}
