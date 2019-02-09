//
//  CGFloat Extension.swift
//  TermostatControl
//
//  Created by Vitalii Maksymliuk on 2/8/19.
//  Copyright © 2019 Vitalii Maksymliuk. All rights reserved.
//

import UIKit

extension CGFloat {
    
    func toRadians() -> CGFloat {
        return self * CGFloat(CGFloat.pi) / 180.0
    }
}
