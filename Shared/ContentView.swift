//
//  ContentView.swift
//  Shared
//
//  Created by Russell Gordon on 2020-09-03.
//

import SwiftUI

// Simulate size classes for macOS
// See: https://stackoverflow.com/a/63526479/5537362
#if os(macOS)
enum UserInterfaceSizeClass {
    case compact
    case regular
}

struct HorizontalSizeClassEnvironmentKey: EnvironmentKey {
    static let defaultValue: UserInterfaceSizeClass = .regular
}
struct VerticalSizeClassEnvironmentKey: EnvironmentKey {
    static let defaultValue: UserInterfaceSizeClass = .regular
}

extension EnvironmentValues {
    var horizontalSizeClass: UserInterfaceSizeClass {
        get { return self[HorizontalSizeClassEnvironmentKey] }
        set { self[HorizontalSizeClassEnvironmentKey] = newValue }
    }
    var verticalSizeClass: UserInterfaceSizeClass {
        get { return self[VerticalSizeClassEnvironmentKey] }
        set { self[VerticalSizeClassEnvironmentKey] = newValue }
    }
}
#endif

struct ContentView: View {
    
    // For positioning elements as needed
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    // Control shape and type of curve
    @State private var parameters = TransformationParameters(a: 1,
                                                             d: 0,
                                                             k: 1,
                                                             c: 0)
    @State private var angle: Degrees = 45
    @State private var functionType: SinusoidalType = .sine
    
    var body: some View {
                
        // Present interface in appropriate orientation
        if horizontalSizeClass == .compact && verticalSizeClass == .regular {
            
            Presentation(parameters: $parameters,
                         angle: $angle,
                         functionType: $functionType,
                         verticalOrientation: true)

        } else if horizontalSizeClass == .regular && verticalSizeClass == .compact {
            
            Presentation(parameters: $parameters,
                         angle: $angle,
                         functionType: $functionType,
                         verticalOrientation: false)
            
        } else if horizontalSizeClass == .regular && verticalSizeClass == .regular {
            
            #if os(macOS)
            Presentation(parameters: $parameters,
                         angle: $angle,
                         functionType: $functionType,
                         verticalOrientation: false)
                    .frame(minWidth: 600, minHeight: 600)
            #else
            if UIDevice.current.localizedModel == "iPad" {
                Presentation(parameters: $parameters,
                             angle: $angle,
                             functionType: $functionType,
                             verticalOrientation: false)
            } else {
                Presentation(parameters: $parameters,
                             angle: $angle,
                             functionType: $functionType,
                             verticalOrientation: true)
            }
            #endif

        } else {
            
            Presentation(parameters: $parameters,
                         angle: $angle,
                         functionType: $functionType,
                         verticalOrientation: false)

        }
        
    }
    
}
