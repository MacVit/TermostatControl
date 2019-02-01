//
//  TemperatureView.swift
//  TermostatControl
//
//  Created by Vitalii Maksymliuk on 1/31/19.
//  Copyright © 2019 Vitalii Maksymliuk. All rights reserved.
//

import UIKit

class TemperatureView: UIView {

    // MARK: - Outlets
    
    @IBOutlet weak var lbTemperature: UILabel!
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUp()
    }
    
    // MARK: - Methods
    
    private func setUp() {
        addSelfNibUsingConstraints()
    }

}
