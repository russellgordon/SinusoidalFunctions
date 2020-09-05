//
//  SinusoidalAxis.swift
//  SinusoidalFunctions (iOS)
//
//  Created by Russell Gordon on 2020-09-05.
//

import SwiftUI

struct SinusoidalAxis: Shape {
    
    var c: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        // Create an empty path
        var path = Path()
        
        // Draw the horizontal axis
        path.move(to: CGPoint(x: 0, y: c))
        path.addLine(to: CGPoint(x: rect.maxX, y: c))
                
        // Define horizontal length of one cycle of the graph
        let period = rect.size.width / (.pi * 2 * 2)
        
        // Define scaling based on size of the rect
        let scaleFactor = CGAffineTransform(scaleX: period,
                                            y: rect.size.height / 4.0)
        
        // Return the entire path of the function
        return path
            .applying(scaleFactor)
            .applying(.transformToTypicalCartesianPlane(rect: rect))

    }
}



struct SinusoidalAxis_Previews: PreviewProvider {
        
    static var previews: some View {
        
        ZStack {
            
            GeometryReader { geometry in

                SinusoidalAxis(c: 0)
                    .stroke(Color.gray, style: StrokeStyle(lineWidth: 1.0, dash: [5.0], dashPhase: 5.0))
                    .padding(.horizontal, 20.0)

            }
            
            Spacer(minLength: 20.0)

        }

    }
}
