//
//  ButtonCustomControl.swift
//  TermostatControl
//
//  Created by Vitalii Maksymliuk on 1/25/19.
//  Copyright © 2019 Vitalii Maksymliuk. All rights reserved.
//

import UIKit

class ButtonCustomControl: UIButton {

    // MARK: - Properties
    
    override var isSelected: Bool {
        didSet {
            
            setupUIState()
        }
    }

    // MARK: - View Methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.width / 2
        layer.masksToBounds = true
    
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnInit()
    }
    
    // MARK: - Methods
    
    func btnInit() {
        
        setupUIState()
//        addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        isSelected = true
    }
    
    func setupUIState() {
        
        layer.backgroundColor = isSelected ? #colorLiteral(red: 0.1107232496, green: 0.105561696, blue: 0.11438898, alpha: 1) : #colorLiteral(red: 0.9195343852, green: 0.1256180406, blue: 0.3506255746, alpha: 1)
        layer.borderWidth = isSelected ? 2 : 0
        layer.borderColor = isSelected ? #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1) : .none
        
    }
    
//    @objc func btnAction() {
//
//        self.isSelected = !self.isSelected
//    }
}
