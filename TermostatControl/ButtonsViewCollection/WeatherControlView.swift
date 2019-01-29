//
//  ButtonsCollection.swift
//  TermostatControl
//
//  Created by Vitalii Maksymliuk on 1/25/19.
//  Copyright © 2019 Vitalii Maksymliuk. All rights reserved.
//

import UIKit

class WeatherControlView: UIView, ButtomControlable {
    
    // MARK: - Outlets
    
    @IBOutlet weak var imDescription: UIImageView!
    @IBOutlet weak var lbDescription: UILabel!
    
    @IBOutlet weak var controlStackView: UIStackView!
    
    @IBOutlet weak var btAirControl: ButtonCustomControl!
    @IBOutlet weak var btWaterControl: ButtonCustomControl!
    @IBOutlet weak var btLightControl: ButtonCustomControl!
    
    @IBOutlet var btControlCollection: [ButtonCustomControl]!
    
    // MARK: - Actions
    
    @IBAction func btControlAction(_ sender: ButtonCustomControl) {
        
        btControlCollection.forEach { (button) in
            
            if button == sender {
                ButtonCustomControl.transition(with: button, duration: 0.5, options: [.preferredFramesPerSecond60, .transitionCrossDissolve], animations: {
                    button.isSelected = false
                }, completion: nil)
                
            } else {
                
                ButtonCustomControl.transition(with: button, duration: 0.5, options: [.preferredFramesPerSecond60, .transitionCrossDissolve], animations: {
                    button.isSelected = true
                }, completion: nil)
            }
        }
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
        
        btControlCollection.first?.isSelected = false
        
        btAirControl.setImage(UIImage(imageLiteralResourceName: "snow_icon_inActive"), for: .selected)
//        btAirControl.setImage(UIImage(imageLiteralResourceName: "snow_icon_Active"), for: .normal)
        
        btWaterControl.setImage(UIImage(imageLiteralResourceName: "water_icon_inActive"), for: .selected)
//        btWaterControl.setImage(UIImage(imageLiteralResourceName: "water_icon_Active"), for: .normal)
        
        btLightControl.setImage(UIImage(imageLiteralResourceName: "sun_icon_inActive"), for: .selected)
//        btLightControl.setImage(UIImage(imageLiteralResourceName: "sun_icon_Active"), for: .normal)
    }
    
    // MARK: - Protocol Implementation
    
    var selectedButtonHanlder: ((Int) -> Void)? {
        didSet {
            
            
            
        }
    }
    
    var setImageDescription: UIImage? {
        didSet {
           imDescription.image = setImageDescription
        }
    }
    
    var setTitleDescription: String? {
        didSet {
            lbDescription.text = setTitleDescription
        }
    }
    
    var setNormalButtonColor: UIColor? {
        didSet {
            btControlCollection.forEach { (button) in
                if button.isSelected == false {
                    button.backgroundColor = setNormalButtonColor
                }
            }
        }
        
        willSet(newColor) {
            btControlCollection.forEach { (button) in
                if button.isSelected == false {
                    button.backgroundColor = newColor
                }
            }
        }
    }
    
    var setSelectedButtonColor: UIColor? {
        didSet {
            btControlCollection.forEach { (button) in
                if button.isSelected == true {
                    button.backgroundColor = setSelectedButtonColor
                }
            }
        }
        
        willSet(newColor) {
            btControlCollection.forEach { (button) in
                if button.isSelected == true {
                    button.backgroundColor = newColor
                }
            }
        }
    }
    
    func addButton(withState normal: UIImage?, selected: UIImage?, and type: UIButton.ButtonType) {
        
        if controlStackView.arrangedSubviews.count < 4 {
         
            let btnNew = UIButton(type: type)
            
            btnNew.setImage(normal, for: .normal)
            btnNew.setImage(selected, for: .selected)
            
            btnNew.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                btnNew.widthAnchor.constraint(equalTo: btnNew.heightAnchor, multiplier: 1 / 1)
                
                ])
            
            controlStackView.addArrangedSubview(btnNew)
        }
    }
}
