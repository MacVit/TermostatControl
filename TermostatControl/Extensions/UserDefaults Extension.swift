//
//  UserDefaults Extension.swift
//  TermostatControl
//
//  Created by Vitalii Maksymliuk on 2/15/19.
//  Copyright © 2019 Vitalii Maksymliuk. All rights reserved.
//

import UIKit

extension UserDefaults {
    /// rotation persistant computed property
    var rotation: CGFloat {
        get {
            return CGFloat(double(forKey: "rotation"))
        }
        set {
            set(Double(newValue), forKey: "rotation")
        }
    }
}
