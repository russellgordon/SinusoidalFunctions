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
    
    let grey = Color(hue: 240.0/360.0, saturation: 0.15, brightness: 0.45, opacity: 0.75)
    let green = Color(hue: 135.0/360.0, saturation: 0.72, brightness: 0.73, opacity: 1.0)
    let red = Color(hue: 3/360.0, saturation: 0.81, brightness: 1.00, opacity: 1.0)

    var body: some View {
        
        // Provide dimensions information for the entire device
        GeometryReader { geometry in
            
            let padding: CGFloat = 20
            
            VStack(spacing: 15) {
                
                // Sinusoidal function
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
                            .fill(grey)
                            .padding(.horizontal, padding)

                        // The transformed function
                        if k != 0 {
                            SinusoidalFunction(a: a,
                                               d: d,
                                               k: k,
                                               c: c,
                                               angle: angle * k,
                                               type: functionType)
                                .fill(functionType == .sine ? red : green)
                                .blendMode(functionType == .sine ? .hardLight : .darken)
                                .padding(.horizontal, padding)
                        }
                    }
                    
                }
                
                // Unit circle
                GeometryReader { geometry in
                    
                    // Show the plane, and then the circle on top of it
                    ZStack {
                        
                        
                        // The plane
                        UnitCirclePlane(height: geometry.size.height,
                                        width: geometry.size.width,
                                        padding: padding)

                        // The unit circle
                        UnitCircle()
                            .stroke(Color.primary, lineWidth: 2.0)
                            .padding(.horizontal, padding)
                        
                        // The reference triangle for original function
                        ReferenceTriangle(angle: angle)
                            .stroke(Color.primary,
                                    style: StrokeStyle(lineWidth: 2,
                                                       lineCap: .square,
                                                       lineJoin: .round))
                            .padding(.horizontal, padding)

                        // The reference triangle for transformed function
                        ReferenceTriangle(angle: angle)
                            .stroke(Color.primary,
                                    style: StrokeStyle(lineWidth: 2,
                                                       lineCap: .square,
                                                       lineJoin: .round))
                            .padding(.horizontal, padding)

                        if functionType == .sine {
                            
                            // The opposite side length
                            OppositeSide(angle: angle)
                                .stroke(Color.gray,
                                        style: StrokeStyle(lineWidth: 2,
                                                           lineCap: .square))
                                .padding(.horizontal, padding)

                            // The opposite side length
                            OppositeSide(angle: angle)
                                .stroke(Color.red,
                                        style: StrokeStyle(lineWidth: 2,
                                                           lineCap: .square))
                                .padding(.horizontal, padding)

                        } else {
                            
                            // The opposide side length
                            AdjacentSide(angle: angle)
                                .stroke(Color.gray,
                                        style: StrokeStyle(lineWidth: 2,
                                                           lineCap: .square))
                                .padding(.horizontal, padding)

                            // The opposide side length
                            AdjacentSide(angle: angle)
                                .stroke(Color.green,
                                        style: StrokeStyle(lineWidth: 2,
                                                           lineCap: .square))
                                .padding(.horizontal, padding)

                        }
                        

                    }
                    
                }
                .background(Color.primary.colorInvert())
                .padding(.all, 0)
                
                // Controls
                VStack(spacing: 0) {
                    
                    // Angle of rotation
                    Text("Angle, 𝜽 = " + String(format: "%.1f", angle))
                    Slider(value: $angle, in: 0...360, step: 1.0)
                        .padding(.horizontal, padding)

                    // Equation
                    if functionType == .sine {
                        Image("sine")
                            .resizable()
                            .scaledToFit()
                            .frame(minHeight: 55, maxHeight: 55)
                    } else {
                        Image("cosine")
                            .resizable()
                            .scaledToFit()
                            .frame(minHeight: 55, maxHeight: 55)
                    }
                    
                    // Type of function
                    Picker("Function type", selection: $functionType) {
                        ForEach(SinusoidalType.allCases, id: \.rawValue) { value in
                            Text("\(value.rawValue)").tag(value)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, padding)
                                                        
                    // Transformation parameters
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
