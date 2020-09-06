//
//  UnitCircle.swift
//  SinusoidalFunctions (iOS)
//
//  Created by Russell Gordon on 2020-09-05.
//

import SwiftUI

struct UnitCircle: Shape {
    
    let p: TransformationParameters

    init(parameters p: TransformationParameters) {
        self.p = p
    }
        
    func path(in rect: CGRect) -> Path {
        
        // One quarter of the vertical space
        let qL = rect.maxY / 4
        
        // Create an empty path
        var path = Path()
        
        // Build the path of the sinsoidal function
        path.addEllipse(in: CGRect(x: -1 * qL * p.a, y: -1 * qL * p.a + p.c * qL, width: qL * 2 * p.a, height: qL * 2 * p.a))
        
        // Return the entire path of the function
        return path
            .applying(.transformToUnitCirclePlane(rect: rect))
    }
    

}

struct UnitCircle_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            VStack {
                
                GeometryReader { geometry in
                    ZStack {
                        
                        let padding: CGFloat = 20

                        // The graph
                        UnitCircle(parameters: TransformationParameters(a: 0.5,
                                                                        d: 0,
                                                                        k: 1,
                                                                        c: 1))
                            .stroke(Color.gray, lineWidth: 2.0)
                            .padding(.horizontal, padding)
                        
                        // The plane
                        UnitCirclePlane(height: geometry.size.height,
                                        width: geometry.size.width,
                                        padding: padding)
                        
                    }
                }
                
                Spacer(minLength: geometry.size.height / 3 * 2)

            }
        }
    }
}

