//
//  ContentView.swift
//  Shared
//
//  Created by Russell Gordon on 2020-09-03.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        VStack {
            
            GeometryReader { geometry in
                ZStack {
                    CartesianPlane()
                        .stroke(lineWidth: 2)
                        .padding()
                }
            }
            
            Spacer(minLength: 300)
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
