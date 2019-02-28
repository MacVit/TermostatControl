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
    
    var lastRotation: CGFloat = UserDefaults.standard.rotation
    
    var bezPath = UIBezierPath()
    let shapeLayer = CAShapeLayer()
    let circleLayer = CAShapeLayer()
    
    var changeAngleHanlder: ((CGFloat) -> Void)?
    
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
    
    fileprivate let rotateAnimation = CABasicAnimation()
    
     private func rotate(to: CGFloat, duration: Double = 0) {
        rotateAnimation.fromValue = to
        rotateAnimation.toValue = to
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount = 0
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.fillMode = .both
        rotateAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        self.layer.add(rotateAnimation, forKey: "transform.rotation.z")
        
        changeAngleHanlder?(to)
    }
    
    func angle(from location: CGPoint) -> CGFloat {
        
        let deltaY = location.y - self.center.y
        let deltaX = location.x - self.center.x
        let angle = atan2(deltaY, deltaX) * 180 / .pi
        
//        print(angle)
        
        return (angle < 0 ? abs(angle) : 360 - angle)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        bezPath = UIBezierPath(arcCenter: CGPoint(x: self.frame.width / 2, y: self.frame.height / 2), radius: self.frame.width / 1.8, startAngle: self.frame.origin.x, endAngle: self.frame.origin.y, clockwise: false)
        
        shapeLayer.path = bezPath.cgPath
        shapeLayer.fillColor = #colorLiteral(red: 0.1107232496, green: 0.105561696, blue: 0.11438898, alpha: 1)
        shapeLayer.strokeColor = #colorLiteral(red: 0.9195343852, green: 0.1256180406, blue: 0.3506255746, alpha: 1)
        shapeLayer.lineWidth = 5
        
        self.layer.insertSublayer(shapeLayer, at: 0)
        
        circleLayer.path = UIBezierPath(arcCenter: CGPoint(x: self.frame.width / 2, y: self.frame.height / 2), radius: self.frame.width / 1.9, startAngle: self.frame.origin.x, endAngle: self.frame.origin.y, clockwise: false).cgPath
        circleLayer.lineWidth = 15
        circleLayer.fillColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        circleLayer.strokeColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        circleLayer.fillColor = #colorLiteral(red: 0.3137470484, green: 0.3136649132, blue: 0.3179933429, alpha: 0.6039437072)
//        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineJoin = .round
        circleLayer.lineDashPattern = [1, 600]
        self.layer.addSublayer(circleLayer)
    }
    
    // MARK: - Gesture method
    
    @objc private func handleThePans(_ gestureRecognizer: UIPanGestureRecognizer) {
        
        let speedRotation: CGFloat = 2.5
        let location = gestureRecognizer.translation(in: self)
        let gestureRotation = CGFloat(angle(from: location) * speedRotation)
        
        switch gestureRecognizer.state {
        case .began:
            
            lastRotation = -gestureRotation
        case .changed:
//            let rotationAngle = lastRotation
            rotate(to: lastRotation + gestureRotation.degreesToRadians)
            
        case .ended:
            
            // update the amount of rotation
            self.lastRotation = gestureRotation.degreesToRadians + lastRotation // - self.startRotationAngle

            self.rotate(to: self.lastRotation)
        default :
            break
        }
        // save the final position of the rotation to defaults
        UserDefaults.standard.rotation = lastRotation + 5
    }
    
    private func setUpPanGestures() {
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleThePans))
        panGesture.minimumNumberOfTouches = 1
        panGesture.maximumNumberOfTouches = 1
        
        self.addGestureRecognizer(panGesture)
    }
    
    // MARK: - Configuration method
    
    private func setUp() {
        
        self.backgroundColor = UIColor.clear
//        self.isUserInteractionEnabled = true
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.5, options: [.preferredFramesPerSecond60, .curveEaseInOut], animations: {
            
            self.center.x -= self.frame.width
            self.transform = CGAffineTransform(rotationAngle: .pi)
            
        }, completion: nil)
        
        setUpPanGestures()
        
    }
}
