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

                        // Labels for the axes
                        Labels(planeWidth: planeWidth, planeHeight: geometry.size.height)
                        
                    }
                }
                
                Spacer(minLength: geometry.size.height / 2)
                
            }
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        ContentView()
    }
}
