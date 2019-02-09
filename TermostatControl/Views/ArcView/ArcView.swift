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
    
    var path: UIBezierPath!
    
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
        
        var bezPath = UIBezierPath()

        bezPath = UIBezierPath(arcCenter: CGPoint(x: self.frame.width * 2.5, y: self.frame.height / 2), radius: self.frame.width * 2.5, startAngle: self.frame.origin.x, endAngle: self.frame.origin.y, clockwise: false)
        
        let smallPathDot = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 5, height: 5))
        let bigPathDot = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 8, height: 8))
        
//        let arrOfDots = [bigPathDot, smallPathDot, smallPathDot, smallPathDot, smallPathDot]
        
        
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = bezPath.cgPath
        
        shapeLayer.fillColor = #colorLiteral(red: 0.1107232496, green: 0.105561696, blue: 0.11438898, alpha: 1)
        shapeLayer.strokeColor = #colorLiteral(red: 0.9195343852, green: 0.1256180406, blue: 0.3506255746, alpha: 1)
        shapeLayer.lineWidth = 5
        
        self.layer.insertSublayer(shapeLayer, at: 0)
        
        let circleLayer = CAShapeLayer()
        circleLayer.path = UIBezierPath(ovalIn: CGRect(x: self.frame.width / 2.5, y: self.frame.height / 2.5, width: self.frame.width * 2.5, height: self.frame.height / 2)).cgPath
        circleLayer.lineWidth = 20
        circleLayer.fillColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        circleLayer.strokeColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineJoin = .round
        circleLayer.lineDashPattern = [NSNumber(value: 1), NSNumber(value: 5)]
        self.layer.addSublayer(circleLayer)
        
//        self.layer.borderWidth = 1.0
//        self.layer.borderColor = UIColor.blue.cgColor
    }
    
    func setUp() {
        self.backgroundColor = #colorLiteral(red: 0.1107232496, green: 0.105561696, blue: 0.11438898, alpha: 1)
    }
}
