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
            
            Spacer(minLength: planeHeight / 3 + planeHeight / 10.0)
            
            let labelWidth: CGFloat = 25.0
            let labelPadding: CGFloat = 5.0

            HStack(spacing: 0) {
                
                Spacer(minLength: planeWidth - 5)
                
                Text("𝜽")
                    .padding(.trailing)
                
            }
            
            Spacer(minLength: 32)

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

            Spacer(minLength: planeHeight / 3 + planeHeight / 10.0)
        }

    }
}

struct Labels_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack {
            
            GeometryReader { geometry in

                // Leading and trailing padding for the axes
                let planeWidth = geometry.size.width - 20.0 * 2.0

                ZStack {
                    Axes()
                        .stroke(Color.black,
                                style: StrokeStyle(lineWidth: 2,
                                                   lineCap: .round,
                                                   lineJoin: .miter))
                        .padding(.horizontal, 20.0)
                    
                    // Labels for the axes
                    Labels(planeWidth: planeWidth, planeHeight: geometry.size.height)
                }

            }
            
            Spacer(minLength: 20.0)

        }
        .previewDevice(PreviewDevice(rawValue: "iPod touch (7th generation)"))

        VStack {
            
            GeometryReader { geometry in

                // Leading and trailing padding for the axes
                let planeWidth = geometry.size.width - 20.0 * 2.0

                ZStack {
                    Axes()
                        .stroke(Color.black,
                                style: StrokeStyle(lineWidth: 2,
                                                   lineCap: .round,
                                                   lineJoin: .miter))
                        .padding(.horizontal, 20.0)
                    
                    // Labels for the axes
                    Labels(planeWidth: planeWidth, planeHeight: geometry.size.height)
                }

            }
            
            Spacer(minLength: 20.0)

        }
        .previewDevice(PreviewDevice(rawValue: "iPhone 11"))

        VStack {
            
            GeometryReader { geometry in

                // Leading and trailing padding for the axes
                let planeWidth = geometry.size.width - 20.0 * 2.0

                ZStack {
                    Axes()
                        .stroke(Color.black,
                                style: StrokeStyle(lineWidth: 2,
                                                   lineCap: .round,
                                                   lineJoin: .miter))
                        .padding(.horizontal, 20.0)
                    
                    // Labels for the axes
                    Labels(planeWidth: planeWidth, planeHeight: geometry.size.height)
                }

            }
            
            Spacer(minLength: 20.0)

        }
        .previewDevice(PreviewDevice(rawValue: "iPad (7th generation)"))

        
    }
    
}
