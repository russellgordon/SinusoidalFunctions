//
//  ContentView.swift
//  Shared
//
//  Created by Russell Gordon on 2020-09-03.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        // Provide dimensions information for the entire device
        GeometryReader { geometry in
            
            VStack {
                
                // Provide dimensions information for the portion of the VStack the plane will occupy
                GeometryReader { geometry in
                    
                    // Show the plane, and then the function on top of it
                    ZStack {
                        
                        let padding: CGFloat = 20

                        // The plane
                        CartesianPlane(height: geometry.size.height,
                                       width: geometry.size.width,
                                       padding: padding)
                        
                        // The function
                        SinusoidalFunction(a: 1,
                                           d: 0,
                                           k: 1,
                                           c: 0,
                                           angle: 720,
                                           type: .sine)
                            .stroke(Color.red, lineWidth: 2.0)
                            .padding(.horizontal, padding)
                        
                    }
                    
                }
                
                // Controls and unit circle will show here eventually
                Spacer(minLength: geometry.size.height / 2)
                
            }
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        ContentView().previewDevice(PreviewDevice(rawValue: "iPad (7th generation)"))
    }
}
