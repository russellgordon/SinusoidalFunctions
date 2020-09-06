//
//  Presentation.swift
//  SinusoidalFunctions
//
//  Created by Russell Gordon on 2020-09-06.
//

import SwiftUI

struct Presentation: View {
    
    // Control shape and type of curve
    @State private var parameters = TransformationParameters(a: 1,
                                                             d: 0,
                                                             k: 1,
                                                             c: 0)
    @State private var angle: Degrees = 45
    @State private var functionType: SinusoidalType = .sine
    
    // Control how simulation elements are arranged based on size of screen
    let verticalOrientation: Bool
    
    var body: some View {
        
        // Provide dimensions information for the entire device
        GeometryReader { geometry in
            
            let padding: CGFloat = 20
            
            if verticalOrientation {
                
                VStack(spacing: 15) {
                    
                    // Sinusoidal function
                    SinusoidalFunctionsIllustration(parameters: parameters,
                                                    angle: angle,
                                                    functionType: functionType,
                                                    padding: 20)
                        .onTapGesture(count: 2) {
                            reset()
                        }
                        .padding(.top, 10)
                    
                    // Unit circle
                    UnitCircleIllustration(parameters: parameters,
                                           angle: angle,
                                           functionType: functionType,
                                           padding: padding)
                        .onTapGesture(count: 2) {
                            reset()
                        }
                    
                    // Controls
                    Controls(parameters: $parameters,
                             angle: $angle,
                             functionType: $functionType,
                             imageHeight: 55)
                        .padding(.horizontal, 20)
                    
                }
                
            } else {

                if geometry.size.height < 400 {
                    
                    // iPod Touch
                    HStack(spacing: 15) {
                        
                        // Controls
                        Controls(parameters: $parameters,
                                 angle: $angle,
                                 functionType: $functionType,
                                 imageHeight: 33)
                            .frame(minWidth: geometry.size.width / 3,
                                   idealWidth: geometry.size.width / 3,
                                   maxWidth: geometry.size.width / 3)
                            .padding(.horizontal, 20)
                        
                        VStack {
                                  
                            // Sinusoidal function
                            SinusoidalFunctionsIllustration(parameters: parameters,
                                                            angle: angle,
                                                            functionType: functionType,
                                                            padding: 20)
                                .onTapGesture(count: 2) {
                                    reset()
                                }
                                .frame(maxHeight: geometry.size.height / 5 * 2)
                            
                            // Unit circle
                            UnitCircleIllustration(parameters: parameters,
                                                   angle: angle,
                                                   functionType: functionType,
                                                   padding: padding)
                                .onTapGesture(count: 2) {
                                    reset()
                                }
                                .frame(maxHeight: geometry.size.height / 5 * 2)
                            
                        }

                    }
                    
                } else {
                    
                    VStack(spacing: 15) {
                        
                        // Sinusoidal function
                        SinusoidalFunctionsIllustration(parameters: parameters,
                                                        angle: angle,
                                                        functionType: functionType,
                                                        padding: 20)
                            .onTapGesture(count: 2) {
                                reset()
                            }
                            .frame(maxHeight: geometry.size.height / 5 * 2)
                        
                        HStack {
                                  
                            Spacer()
                            
                            // Controls
                            Controls(parameters: $parameters,
                                     angle: $angle,
                                     functionType: $functionType,
                                     imageHeight: 55)
                                .frame(minWidth: geometry.size.width / 3,
                                       idealWidth: geometry.size.width / 3,
                                       maxWidth: geometry.size.width / 3)
                                .padding(.horizontal, 20)

                            // Unit circle
                            UnitCircleIllustration(parameters: parameters,
                                                   angle: angle,
                                                   functionType: functionType,
                                                   padding: padding)
                                .onTapGesture(count: 2) {
                                    reset()
                                }
                                .frame(maxHeight: geometry.size.height / 5 * 2)
                            
                        }
                        
                    }
                    .padding(.vertical, 20)

                }
                
            }
            
        }
    }
    
    func reset() {
        // Reset transformations and angle of rotation
        parameters = TransformationParameters.defaultValues
        angle = 45
    }
    
}

struct Presentation_Previews: PreviewProvider {
    static var previews: some View {
        
        Presentation(verticalOrientation: true)
        // Source for landscape view:
        // https://stackoverflow.com/a/56629828/5537362
        Presentation(verticalOrientation: false)
            .previewLayout(.fixed(width: 568, height: 320)) // iPhone SE landscape size
        
    }
}
