//
//  ViewController.swift
//  TermostatControl
//
//  Created by Vitalii Maksymliuk on 1/25/19.
//  Copyright © 2019 Vitalii Maksymliuk. All rights reserved.
//

import UIKit

class TermostatVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var weatherControlView: WeatherControlView!
    @IBOutlet weak private var powerSliderView: PowerSlideView!
    @IBOutlet weak var arcWheel: ArcView!
    @IBOutlet weak var temperatureView: TemperatureView!
    @IBOutlet weak private var weatherControlViewHeight: NSLayoutConstraint!
    
    // MARK: - Properties
    
    var temperatureAngle: CGFloat = 0 {
        didSet {
          temperatureView.lbTemperature.text = temperatureAngle.description
        }
    }
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherControlView.selectedButtonHanlder = { (selectedIndex) in
            
            print("Did select at \(selectedIndex)")
        }
        
//        let rotation = Int(UserDefaults.standard.rotation / 5)
//        print("Last Rotation \(rotation)")
        
        
//        temperatureView.lbTemperature.text = "\(-rotation)"
        
        arcWheel.changeAngleHanlder = { angle in
            
//            let range = -40...40
            let modifiedAngle = (-angle.rounded() * 0.8)
            
            
            self.temperatureView.temperature = Int(modifiedAngle.rounded())
            print(self.temperatureView.temperature)
        }
        
        
//        temperatureView.lbTemperature.text = "\(Int(UserDefaults.standard.rotation) / 3)"
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

