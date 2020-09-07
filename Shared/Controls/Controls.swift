//
//  Controls.swift
//  SinusoidalFunctions (iOS)
//
//  Created by Russell Gordon on 2020-09-06.
//

import SwiftUI

struct Controls: View {
    
    @Binding var parameters: TransformationParameters
    @Binding var angle: Degrees
    @Binding var functionType: SinusoidalType
    let imageHeight: CGFloat
    
    var body: some View {
        
        VStack() {
            
            Spacer()
            
            // Angle of rotation
            Text("Angle, 𝜽 = " + String(format: "%.1f", angle))
            Slider(value: $angle, in: 0...360, step: 1.0)

            // Equation
            if functionType == .sine {
                Image("sine-svg")
                    .resizable()
                    .scaledToFit()
                    .frame(minHeight: imageHeight, maxHeight: imageHeight)
            } else {
                Image("cosine-svg")
                    .resizable()
                    .scaledToFit()
                    .frame(minHeight: imageHeight, maxHeight: imageHeight)
            }
            
            // Type of function
            Picker("Function type", selection: $functionType) {
                ForEach(SinusoidalType.allCases, id: \.rawValue) { value in
                    Text("\(value.rawValue)").tag(value)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.bottom, 10)
                                                
            // Transformation parameters
            HStack {
                                        
                VStack {
                    Text("a = " + String(format: "%.1f", parameters.a))
                    Slider(value: $parameters.a, in: -2...2, step: 0.1)

                    Text("c = " + String(format: "%.1f", parameters.c))
                    Slider(value: $parameters.c, in: -2...2, step: 0.1)
                }
                
                VStack {
                    Text("k = " + String(format: "%.1f", parameters.k))
                    Slider(value: $parameters.k, in: -2...2, step: 0.1)

                    Text("d = " + String(format: "%.1f", parameters.d))
                    Slider(value: $parameters.d, in: 0...720, step: 1.0)

                }


            }
            
            Spacer()
        
        }
        .padding(.vertical, 10)

    }
}

//struct Controls_Previews: PreviewProvider {
//    static var previews: some View {
//        Controls(a: $a, d: $d, k: $k, c: $c, angle: $angle, functionType: .sine, padding: 20)
//    }
//}
