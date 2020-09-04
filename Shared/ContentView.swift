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
                        CartesianPlane()
                            .stroke(Color.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .miter))
                            .padding()
                    }
                }
                
                Spacer(minLength: geometry.size.height / 3)

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
