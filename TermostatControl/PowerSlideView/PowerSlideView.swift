//
//  PowerSlideView.swift
//  TermostatControl
//
//  Created by Vitalii Maksymliuk on 1/30/19.
//  Copyright © 2019 Vitalii Maksymliuk. All rights reserved.
//

import UIKit

class PowerSlideView: UIView {

    // MARK: - Outlets
    
    @IBOutlet weak var sliderConrol: CustomSliderControl!
    
    // MARK: - Actions
    
    @IBAction func togglePowerAction(_ sender: UIButton) {
        
    }
    @IBAction func slidePowerAction(_ sender: Any) {
        
    }
    
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
