//
//  Labels.swift
//  SinusoidalFunctions
//
//  Created by Russell Gordon on 2020-09-04.
//

import SwiftUI

struct Labels: View {
    
    var planeWidth: CGFloat
    var planeHeight: CGFloat
    
    var body: some View {
        VStack {
            
            Spacer()
            
            let labelWidth: CGFloat = 25.0
            let labelPadding: CGFloat = 5.0

            // Label the plane's horizontal axis
            HStack(spacing: (planeWidth - 8.0 * (labelWidth + labelPadding)) / 8.0 ) {
                Group {
                    Text("90°")
                    Text("180°")
                    Text("270°")
                    Text("360°")
                    Text("450°")
                    Text("540°")
                    Text("630°")
                    Text("720°")
                }
                .modifier(AxisLabel(width: labelWidth))
            }
            .padding(.leading, planeWidth / 8.0)
            .padding(.bottom, 10.0)
            
            Spacer(minLength: planeHeight / 2 + planeHeight / 64.0)
        }

    }
}