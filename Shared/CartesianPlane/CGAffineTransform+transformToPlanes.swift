//
//  CGAffineTransform+transformToTypicalCartesianPlane.swift
//  SinusoidalFunctions
//
//  Created by Russell Gordon on 2020-09-04.
//

import SwiftUI

extension CGAffineTransform {
    
    static func transformToTypicalCartesianPlane(rect: CGRect) -> CGAffineTransform {
        
        // Flip so that positive values on vertical axis move items up on screen
        let flip = CGAffineTransform(scaleX: 1, y: -1)
        
        // Translate downward half the height of the available space
        let translate = CGAffineTransform(translationX: 0, y: rect.height / 2)
        
        // Build the series of transformations
        var series = flip
        series = series.concatenating(translate)
        
        // Return the transformations
        return series

    }

    static func transformToUnitCirclePlane(rect: CGRect) -> CGAffineTransform {
        
        // Flip so that positive values on vertical axis move items up on screen
        let flip = CGAffineTransform(scaleX: 1, y: -1)
        
        // Translate downward half the height of the available space, and, rightward half the width of the available space
        let translate = CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2)

        // Build the series of transformations
        var series = flip
        series = series.concatenating(translate)
        
        // Return the transformations
        return series

    }

}
