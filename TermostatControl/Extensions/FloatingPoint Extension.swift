//
//  FloatingPoint Extension.swift
//  TermostatControl
//
//  Created by Vitalii Maksymliuk on 2/15/19.
//  Copyright © 2019 Vitalii Maksymliuk. All rights reserved.
//

import UIKit

extension FloatingPoint {
    
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}
