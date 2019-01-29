//
//  ButtomControlable.swift
//  TermostatControl
//
//  Created by Vitalii Maksymliuk on 1/28/19.
//  Copyright © 2019 Vitalii Maksymliuk. All rights reserved.
//

import UIKit

protocol ButtomControlable {
    
    var selectedButtonHanlder: ((Int) -> Void)? { get set }
    
    var setImageDescription: UIImage? { get set }
    
    var setTitleDescription: String? { get set }
    
    var setNormalButtonColor: UIColor? { get set }
    
    var setSelectedButtonColor: UIColor? { get set }
    
    func addButton(withState normal: UIImage?, selected: UIImage?, and type: UIButton.ButtonType)
}
