//
//  UnitCircleIllustration.swift
//  SinusoidalFunctions (iOS)
//
//  Created by Russell Gordon on 2020-09-05.
//

import SwiftUI

struct UnitCircleIllustration: View {
    
    var angle: Degrees
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                GeometryReader { geometry in
                    ZStack {
                        
                        let padding: CGFloat = 20

                        // The graph
                        UnitCircle()
                            .stroke(Color.gray, lineWidth: 2.0)
                            .padding(.horizontal, padding)
                        
                        // The reference triangle
                        ReferenceTriangle(angle: angle)
                            .fill(Color.gray)
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

struct UnitCircleIllustration_Previews: PreviewProvider {
    static var previews: some View {
        UnitCircleIllustration(angle: 45)
    }
}
