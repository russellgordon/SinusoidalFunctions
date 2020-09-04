//
//  AxisLabel.swift
//  SinusoidalFunctions
//
//  Created by Russell Gordon on 2020-09-04.
//

import SwiftUI

struct AxisLabel: ViewModifier {
    
    var width: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14, weight: .light, design: .serif))
            .frame(minWidth: width)

    }
    
}
