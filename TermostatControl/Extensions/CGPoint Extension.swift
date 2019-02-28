//
//  CGPoint Extension.swift
//  TermostatControl
//
//  Created by Vitalii Maksymliuk on 2/28/19.
//  Copyright © 2019 Vitalii Maksymliuk. All rights reserved.
//

import UIKit

extension CGPoint {
    
    func angle(to comparisonPoint: CGPoint) -> CGFloat {
        let originX = comparisonPoint.x - self.x
        let originY = comparisonPoint.y - self.y
        let bearingRadians = atan2(originY, originX)
        var bearingDegrees = CGFloat(bearingRadians).radiansToDegrees
        while bearingDegrees < 0 {
            bearingDegrees += 360
        }
        return bearingDegrees
    }
}
