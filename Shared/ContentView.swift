//
//  ContentView.swift
//  Shared
//
//  Created by Russell Gordon on 2020-09-03.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                
                GeometryReader { geometry in
                    ZStack {
                        
                        let padding: CGFloat = 20.0
                        let planeWidth = geometry.size.width - padding * 2.0
                        
                        // Draw the plane as a shape
                        Axes(verticalUnit: geometry.size.height / 64.0,
                                       horizontalUnit: planeWidth / 8.0)
                            .stroke(Color.black, style: StrokeStyle(lineWidth: 2,
                                                                    lineCap: .round,
                                                                    lineJoin: .miter))
                            .padding(.horizontal, padding)
                        
                        VStack {
                            
                            Spacer()
                            
                            let labelWidth: CGFloat = 25.0
                            let labelPadding: CGFloat = 5.0

                            // Label the plane's horizontal axis
                            HStack(spacing: (planeWidth - 8.0 * (labelWidth + labelPadding)) / 8.0 ) {
                                Group {
                                    Text("90°")
                                    Text("180°")
                                    Text("270°")
                                    Text("360°")
                                    Text("450°")
                                    Text("540°")
                                    Text("630°")
                                    Text("720°")
                                }
                                .modifier(AxisLabel(width: labelWidth))
                            }
                            .padding(.leading, planeWidth / 8.0)
                            .padding(.bottom, 10.0)
                            
                            Spacer(minLength: geometry.size.height / 2 + geometry.size.height / 64.0)
                        }
                        
                    }
                }
                
                Spacer(minLength: geometry.size.height / 2)
                
            }
            
        }
    }
    
}

struct AxisLabel: ViewModifier {
    
    var width: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14, weight: .light, design: .serif))
            .frame(minWidth: width)

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        ContentView()
    }
}
