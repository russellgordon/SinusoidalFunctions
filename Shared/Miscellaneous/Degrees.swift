//
//  Degrees.swift
//  SinusoidalFunctions (iOS)
//
//  Created by Russell Gordon on 2020-09-06.
//

import SwiftUI

typealias Degrees = CGFloat

extension Degrees {
    
    func inRadians() -> CGFloat {
        return self * .pi / 180.0
    }
    
}
