//
//  PowerSlideView.swift
//  TermostatControl
//
//  Created by Vitalii Maksymliuk on 1/30/19.
//  Copyright © 2019 Vitalii Maksymliuk. All rights reserved.
//

import UIKit

class PowerSlideView: UIView {

    // MARK: - Properties
    
    // MARK: - Outlets
    @IBOutlet weak var imFanView: UIImageView!
    
    @IBOutlet weak var sliderConrol: CustomSliderControl!
    
    // MARK: - Actions
    
    @IBAction func togglePowerAction(_ sender: UIButton) {
        
    }
    @IBAction func slidePowerAction(_ sender: CustomSliderControl) {
        
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
        
//        let minimumImage = sliderConrol.minimumValueImage
//        let minimumImageview = UIImageView(image: minimumImage)
        
        sliderConrol.addTarget(self, action: #selector(sliderChanged(_:)), for: .valueChanged)
    }
    
    @objc func sliderChanged(_ sender: CustomSliderControl) {
        
        self.imFanView.transform = CGAffineTransform(rotationAngle: CGFloat(sender.value * Float(Double.pi * 5)))
        print(sender.value)
        
    }

}
