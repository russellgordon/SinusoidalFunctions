//
//  ContentView.swift
//  Shared
//
//  Created by Russell Gordon on 2020-09-03.
//

import SwiftUI

struct ContentView: View {
    
    let initialA: CGFloat = 1
    let initialD: Degrees = 0
    let initialK: CGFloat = 1
    let initialC: CGFloat = 0

    @State private var a: CGFloat = 1
    @State private var d: Degrees = 0
    @State private var k: CGFloat = 1
    @State private var c: CGFloat = 0
    @State private var angle: Degrees = 0
    @State private var functionType: SinusoidalType = .sine
    
    var body: some View {
        
        // Provide dimensions information for the entire device
        GeometryReader { geometry in
            
            let padding: CGFloat = 20
            
            VStack {
                
                // Provide dimensions information for the portion of the VStack the plane will occupy
                GeometryReader { geometry in
                    
                    // Show the plane, and then the function on top of it
                    ZStack {
                        
                        // The plane
                        CartesianPlane(height: geometry.size.height - 40,
                                       width: geometry.size.width,
                                       padding: padding)
                        
                        // The original function
                        SinusoidalFunction(a: initialA,
                                           d: initialD,
                                           k: initialK,
                                           c: initialC,
                                           angle: 720,
                                           type: functionType)
                            .stroke(Color.gray, style: StrokeStyle(lineWidth: 1.0, dash: [5.0], dashPhase: 5.0))
                            .padding(.horizontal, padding)

                        // The transformed function
                        SinusoidalFunction(a: a,
                                           d: d,
                                           k: k,
                                           c: c,
                                           angle: 720,
                                           type: functionType)
                            .stroke(Color.red, lineWidth: 2.0)
                            .padding(.horizontal, padding)
                    }
                    
                }
                
                // Controls
                VStack(spacing: 0) {
                    
                    // Equation
                    if functionType == .sine {
                        Image("sine")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 55)
                    } else {
                        Image("cosine")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 55)
                    }
                    
                    Picker("Function type", selection: $functionType) {
                        ForEach(SinusoidalType.allCases, id: \.rawValue) { value in
                            Text("\(value.rawValue)").tag(value)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, padding)
                                    
                    // Controls and unit circle will show here eventually
                    HStack {
                        
                        VStack {
                            Text("a = " + String(format: "%.1f", a))
                            Slider(value: $a, in: -2...2, step: 0.1)
                                .padding(.horizontal, padding)

                            Text("c = " + String(format: "%.1f", c))
                            Slider(value: $c, in: -2...2, step: 0.1)
                                .padding(.horizontal, padding)
                        }
                        
                        VStack {
                            Text("k = " + String(format: "%.1f", k))
                            Slider(value: $k, in: -2...2, step: 0.1)
                                .padding(.horizontal, padding)

                            Text("d = " + String(format: "%.1f", d))
                            Slider(value: $d, in: 0...720, step: 1.0)
                                .padding(.horizontal, padding)

                        }


                    }
                    .padding(.vertical, padding)
                }
                .background(Color.primary.colorInvert())
                .padding(.all, 0)
                
            }
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPod touch (7th generation)"))
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        ContentView().previewDevice(PreviewDevice(rawValue: "iPad (7th generation)"))
    }
}
