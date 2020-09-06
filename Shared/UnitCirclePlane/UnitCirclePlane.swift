//
//  SwiftUIView.swift
//  SinusoidalFunctions
//
//  Created by Russell Gordon on 2020-09-05.
//

import SwiftUI

struct UnitCirclePlane: View {
    
    var height: CGFloat
    var width: CGFloat
    var padding: CGFloat
    
    var body: some View {
        
        ZStack {

            // Draw the plane as a shape
            UnitCircleAxes()
                .stroke(Color.primary,
                        style: StrokeStyle(lineWidth: 2,
                                           lineCap: .round,
                                           lineJoin: .miter))
                .padding(.horizontal, padding)

        }

    }
}

struct UnitCirclePlane_Previews: PreviewProvider {
    
    static var previews: some View {
        
        GeometryReader { geometry in
            UnitCirclePlane(height: geometry.size.width,
                           width: geometry.size.width,
                           padding: 20)
                .frame(width: geometry.size.width, height: geometry.size.width)
        }
        .padding(.horizontal, 20.0)

        
    }
    
}
