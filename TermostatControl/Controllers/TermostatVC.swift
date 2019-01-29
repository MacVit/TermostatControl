//
//  ViewController.swift
//  TermostatControl
//
//  Created by Vitalii Maksymliuk on 1/25/19.
//  Copyright © 2019 Vitalii Maksymliuk. All rights reserved.
//

import UIKit

class TermostatVC: UIViewController {

    @IBOutlet weak private var buttonsViewCollection: WeatherControlView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        buttonsViewCollection.selectedButtonHanlder = { (selectedIndex) in
//            print("Did select at \(selectedIndex)")
//        }
    }
}

