//
//  ViewController.swift
//  TermostatControl
//
//  Created by Vitalii Maksymliuk on 1/25/19.
//  Copyright © 2019 Vitalii Maksymliuk. All rights reserved.
//

import UIKit

class TermostatVC: UIViewController {

    @IBOutlet weak private var weatherControlView: WeatherControlView!
    @IBOutlet weak private var powerSliderView: PowerSlideView!
    
    @IBOutlet weak var weatherControlViewHeight: NSLayoutConstraint!
    @IBOutlet weak var powerSliderViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherControlView.selectedButtonHanlder = { (selectedIndex) in
            
            print("Did select at \(selectedIndex)")
        }
    }
}

