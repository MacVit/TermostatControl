//
//  ArcView.swift
//  TermostatControl
//
//  Created by Vitalii Maksymliuk on 2/7/19.
//  Copyright © 2019 Vitalii Maksymliuk. All rights reserved.
//

import UIKit

class ArcView: UIView {

    // MARK: - Properties
    
    var bezPath = UIBezierPath()
    let shapeLayer = CAShapeLayer()
    let circleLayer = CAShapeLayer()
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()

        bezPath = UIBezierPath(arcCenter: CGPoint(x: self.frame.width * 2.5, y: self.frame.height / 2), radius: self.frame.width * 2.5, startAngle: self.frame.origin.x, endAngle: self.frame.origin.y, clockwise: false)
        
        shapeLayer.path = bezPath.cgPath
        shapeLayer.fillColor = #colorLiteral(red: 0.1107232496, green: 0.105561696, blue: 0.11438898, alpha: 1)
        shapeLayer.strokeColor = #colorLiteral(red: 0.9195343852, green: 0.1256180406, blue: 0.3506255746, alpha: 1)
        shapeLayer.lineWidth = 5
        
        self.layer.insertSublayer(shapeLayer, at: 0)
        
        circleLayer.path = UIBezierPath(arcCenter: CGPoint(x: self.frame.width * 2.5, y: self.frame.height / 2), radius: self.frame.width * 2.3, startAngle: self.frame.origin.x, endAngle: self.frame.origin.y, clockwise: false).cgPath
        circleLayer.lineWidth = 20
        circleLayer.fillColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        circleLayer.strokeColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        circleLayer.fillColor = #colorLiteral(red: 0.3137470484, green: 0.3136649132, blue: 0.3179933429, alpha: 0.6039437072)
//        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineJoin = .round
        circleLayer.lineDashPattern = [1, 800]
        self.layer.addSublayer(circleLayer)
        
//        self.layer.borderWidth = 1.0
//        self.layer.borderColor = UIColor.blue.cgColor
    }
    
    // MARK: - Gesture method
    
    @objc private func didRotate() {
        
        let type = UIRotationGestureRecognizer()
        
        self.superview?.bringSubviewToFront(self)
        let rotation = type.rotation
        
        self.transform = CGAffineTransform.init(rotationAngle: rotation)
        
        type.rotation = 0.0
    }
    
    @objc private func handleSwipes()  {
        print("Trigering swipe gestures")
        
//        UIView.transition(with: self, duration: 3, options: [], animations: {
//            self.transform = CGAffineTransform.init(rotationAngle: self.frame.width)
//        }, completion: nil)
        
    }
    
    @objc private func handleThePans() {
        print("pan is working")
    }
    
    private func setUpSwipeGestures() -> [UISwipeGestureRecognizer] {
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        
        swipeUp.direction = .up
        swipeDown.direction = .down
        
        self.addGestureRecognizer(swipeUp)
        self.addGestureRecognizer(swipeDown)
        
        return [swipeUp, swipeDown]
    }
    
    private func setUpPanGestures(swipeGestures: [UISwipeGestureRecognizer]) {
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleThePans))
        
        for swipeGesture in swipeGestures {
            panGesture.require(toFail: swipeGesture)
        }
        
        self.addGestureRecognizer(panGesture)
    }
    
    // MARK: - Configuration method
    
    private func setUp() {
        
        self.backgroundColor = #colorLiteral(red: 0.1107232496, green: 0.105561696, blue: 0.11438898, alpha: 1)
        self.isUserInteractionEnabled = true

        let swipeGestures = setUpSwipeGestures()
        setUpPanGestures(swipeGestures: swipeGestures)
        
//        let panGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didRotate))
//        self.addGestureRecognizer(panGestureRecognizer)
        
        
    }
    
}
