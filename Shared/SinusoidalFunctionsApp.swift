//
//  SinusoidalFunctionsApp.swift
//  Shared
//
//  Created by Russell Gordon on 2020-09-03.
//

import SwiftUI

@main
struct SinusoidalFunctionsApp: App {
    
    @Environment(\.openURL) var openURL
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.commands {
            
            // Wire up the Help menu
            // See: https://itnext.io/swiftui-keyboard-shortcuts-and-menu-bar-be22abbb3791
            CommandGroup(replacing: CommandGroupPlacement.help) {

                Button(action: {
                    openURL(URL(string: "https://www.russellgordon.ca/apps#periodically")!)
                }) {
                    Text("Periodically Help")
                }
                
            }
        }
    }
}
