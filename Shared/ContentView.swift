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
                    
                    // Show the plane, and then the graph on top of it (eventually)
                    ZStack {

                        // The plane
                        CartesianPlane(height: geometry.size.height, width: geometry.size.width)
                        
                        // The graph (not here yet)
                        
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
