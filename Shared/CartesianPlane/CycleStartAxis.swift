//
//  CycleStart.swift
//  SinusoidalFunctions (iOS)
//
//  Created by Russell Gordon on 2020-09-06.
//

import SwiftUI

struct CycleStartAxis: Shape {
    
    var d: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        // Create an empty path
        var path = Path()
        
        // Draw the horizontal axis
        path.move(to: CGPoint(x: d.inRadians(), y: rect.height / 2))
        path.addLine(to: CGPoint(x: d.inRadians(), y: -rect.height / 2))
                
        // Define horizontal length of one cycle of the graph
        let period = rect.size.width / (.pi * 2 * 2)
        
        // Define scaling based on size of the rect
        let scaleFactor = CGAffineTransform(scaleX: period,
                                            y: 1)

        // Return the entire path of the function
        return path
            .applying(scaleFactor)
            .applying(.transformToTypicalCartesianPlane(rect: rect))

    }
}

struct CycleStartAxis_Previews: PreviewProvider {
        
    static var previews: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                GeometryReader { geometry in

                    CycleStartAxis(d: 90)
                        .stroke(Color.gray, style: StrokeStyle(lineWidth: 1.0, dash: [5.0], dashPhase: 5.0))
                        .padding(.horizontal, 20.0)

                }
                
                Spacer(minLength: geometry.size.height / 3 * 2)

            }

        }

    }
}
