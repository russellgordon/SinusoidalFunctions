//
//  SinusoidalFunctionsIllustration.swift
//  SinusoidalFunctions (iOS)
//
//  Created by Russell Gordon on 2020-09-06.
//

import SwiftUI

struct SinusoidalFunctionsIllustration: View {
    
    let a: CGFloat
    let d: Degrees
    let k: CGFloat
    let c: CGFloat
    let angle: Degrees
    let functionType: SinusoidalType = .sine
    
    let initialA: CGFloat
    let initialD: Degrees
    let initialK: CGFloat
    let initialC: CGFloat
    
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
                SinusoidalFunction(a: initialA,
                                   d: initialD,
                                   k: initialK,
                                   c: initialC,
                                   angle: angle,
                                   type: functionType)
                    .fill(Color.parentFunction)
                    .padding(.horizontal, padding)

                // The transformed function
                if k != 0 {
                    SinusoidalFunction(a: a,
                                       d: d,
                                       k: k,
                                       c: c,
                                       angle: angle * k,
                                       type: functionType)
                        .fill(functionType == .sine ? Color.transformedSine : Color.transformedCosine)
                        .padding(.horizontal, padding)
                    
                }
                
                // Show the sinusoidal axis when there is a vertical shift
                if c != 0 {
                    SinusoidalAxis(c: c)
                        .stroke(functionType == .sine ? Color.transformedSine : Color.transformedCosine, style: StrokeStyle(lineWidth: 1.0, dash: [5.0], dashPhase: 5.0))
                        .padding(.horizontal, 20.0)

                }
            }
            
        }

    }
}

struct SinusoidalFunctionsIllustration_Previews: PreviewProvider {
    static var previews: some View {
        SinusoidalFunctionsIllustration(a: 1,
                                        d: 0,
                                        k: 1,
                                        c: 0,
                                        angle: 45,
                                        initialA: 1,
                                        initialD: 0,
                                        initialK: 1,
                                        initialC: 0,
                                        padding: 20)
    }
}
