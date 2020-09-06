//
//  SinusoidalFunctionsIllustration.swift
//  SinusoidalFunctions (iOS)
//
//  Created by Russell Gordon on 2020-09-06.
//

import SwiftUI

struct SinusoidalFunctionsIllustration: View {
    
    let parameters: TransformationParameters
    let angle: Degrees
    let functionType: SinusoidalType
    let padding: CGFloat

    var body: some View {
        GeometryReader { geometry in
            
            // Show the plane, and then the function on top of it
            ZStack {
                
                // The plane
                CartesianPlane(height: geometry.size.height - 80,
                               width: geometry.size.width,
                               padding: padding)
                
                // The original function
                SinusoidalFunction(parameters: TransformationParameters.defaultValues,
                                   angle: angle,
                                   functionType: functionType)
                    .fill(Color.parentFunction)
                    .padding(.horizontal, padding)

                // The transformed function
                if parameters.k != 0 {
                    SinusoidalFunction(parameters: parameters,
                                       angle: angle * parameters.k,
                                       functionType: functionType)
                        .fill(functionType == .sine ? Color.transformedSine : Color.transformedCosine)
                        .padding(.horizontal, padding)
                        .clipped()
                    
                }
                
                // Show the sinusoidal axis when there is a vertical shift
                if parameters.c != 0 {
                    SinusoidalAxis(c: parameters.c)
                        .stroke(functionType == .sine ? Color.transformedSine : Color.transformedCosine, style: StrokeStyle(lineWidth: 1.0, dash: [5.0], dashPhase: 5.0))
                        .padding(.horizontal, 20.0)

                }

                // Show the the start of a cycle when there is a horizontal shift
                if parameters.d != 0 {
                    CycleStartAxis(d: parameters.d)
                        .stroke(functionType == .sine ? Color.transformedSine : Color.transformedCosine, style: StrokeStyle(lineWidth: 1.0, dash: [5.0], dashPhase: 5.0))
                        .padding(.horizontal, 20.0)

                }

            }
            
        }

    }
}

struct SinusoidalFunctionsIllustration_Previews: PreviewProvider {
    static var previews: some View {
        SinusoidalFunctionsIllustration(parameters: TransformationParameters(a: 1,
                                                                             d: 90,
                                                                             k: 1,
                                                                             c: 1.5),
                                        angle: 45,
                                        functionType: .sine,
                                        padding: 20)
    }
}
