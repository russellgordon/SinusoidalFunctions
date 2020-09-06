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
    
    var body: some View {
                
        // Present interface in appropriate orientation
        if horizontalSizeClass == .compact && verticalSizeClass == .regular {
            
            Presentation(verticalOrientation: true)

        } else if horizontalSizeClass == .regular && verticalSizeClass == .compact {
            
            Presentation(verticalOrientation: false)
            
        } else if horizontalSizeClass == .regular && verticalSizeClass == .regular {
            
            Presentation(verticalOrientation: true)
            
        } else {

            Presentation(verticalOrientation: false)

        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Presentation(verticalOrientation: true).previewDevice(PreviewDevice(rawValue: "iPod touch (7th generation)"))
        Presentation(verticalOrientation: true).previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        Presentation(verticalOrientation: true).previewDevice(PreviewDevice(rawValue: "iPad (7th generation)"))
    }
}
