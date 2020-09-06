//
//  ContentView.swift
//  Shared
//
//  Created by Russell Gordon on 2020-09-03.
//

import SwiftUI

struct ContentView: View {
    
    // Control shape and type of curve
    @State private var parameters = TransformationParameters(a: 1,
                                                             d: 0,
                                                             k: 1,
                                                             c: 0)
    @State private var angle: Degrees = 45
    @State private var functionType: SinusoidalType = .sine
    
    var body: some View {
        
        // Provide dimensions information for the entire device
        GeometryReader { geometry in
            
            let padding: CGFloat = 20
            
            VStack(spacing: 15) {
                
                // Sinusoidal function
                SinusoidalFunctionsIllustration(parameters: parameters,
                                                angle: angle,
                                                functionType: functionType,
                                                padding: 20)
                    .onTapGesture(count: 2) {
                        reset()
                    }

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
                         padding: padding)
                
            }
            
        }
    }
    
    func reset() {
        // Reset transformations and angle of rotation
        parameters = TransformationParameters.defaultValues
        angle = 45
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPod touch (7th generation)"))
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        ContentView().previewDevice(PreviewDevice(rawValue: "iPad (7th generation)"))
    }
}
