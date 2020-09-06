//
//  TransformationParameters.swift
//  SinusoidalFunctions (iOS)
//
//  Created by Russell Gordon on 2020-09-06.
//

import SwiftUI

struct TransformationParameters {
    
    var a: CGFloat
    var d: Degrees
    var k: CGFloat
    var c: CGFloat
    
    static var defaultValues = TransformationParameters(a: 1,
                                                        d: 0,
                                                        k: 1,
                                                        c: 0)
}
