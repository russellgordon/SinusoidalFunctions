//
//  ContentView.swift
//  Shared
//
//  Created by Russell Gordon on 2020-09-03.
//

import SwiftUI

struct ContentView: View {
    
    // Control shape and type of curve
    @State private var a: CGFloat = 1
    @State private var d: Degrees = 0
    @State private var k: CGFloat = 1
    @State private var c: CGFloat = 0
    @State private var angle: Degrees = 0
    @State private var functionType: SinusoidalType = .sine
    
    let initialA: CGFloat = 1
    let initialD: Degrees = 0
    let initialK: CGFloat = 1
    let initialC: CGFloat = 0

    var body: some View {
        
        // Provide dimensions information for the entire device
        GeometryReader { geometry in
            
            let padding: CGFloat = 20
            
            VStack(spacing: 15) {
                
                // Sinusoidal function
                SinusoidalFunctionsIllustration(a: a,
                                                d: d,
                                                k: k,
                                                c: c,
                                                angle: angle,
                                                initialA: initialA,
                                                initialD: initialD,
                                                initialK: initialK,
                                                initialC: initialC,
                                                padding: 20)
                
                // Unit circle
                UnitCircleIllustration(a: a,
                                       c: c,
                                       initialA: initialA,
                                       initialC: initialC,
                                       angle: angle,
                                       functionType: functionType,
                                       padding: padding)
                
                // Controls
                Controls(a: $a,
                         d: $d,
                         k: $k,
                         c: $c,
                         angle: $angle,
                         functionType: $functionType,
                         padding: padding)
                
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
