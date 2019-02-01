//
//  CustomSlider.swift
//  TermostatControl
//
//  Created by Vitalii Maksymliuk on 1/30/19.
//  Copyright © 2019 Vitalii Maksymliuk. All rights reserved.
//

import UIKit

class CustomSliderControl: UISlider {
    
    // MARK: - Methods from Super Class
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        var newRect = bounds
        print("before rect origin Y ---\(newRect.origin.y)")
        newRect.size.height = 10
        newRect.origin.y = (self.frame.height - newRect.height) / 2
//        newRect.size.height = self.bounds.size.height / 2
        print("after rect origin Y ---\(newRect.origin.y)")
        
        print("Newrect height ---\(newRect.height)")
        
        print("self.frame.height ---\(self.frame.height)")
        
        return newRect
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        print(bounds.width)
//        print(bounds.height)
    }
    
//    private var thumbTouchSize = CGSize(width: 270, height: 20)
//
//    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//        let increasedBounds = bounds.insetBy(dx: -thumbTouchSize.width, dy: -thumbTouchSize.height)
//        let containsPoint = increasedBounds.contains(point)
//        return containsPoint
//    }
//
//    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
//        let percentage = CGFloat((value - minimumValue) / (maximumValue - minimumValue))
//        let thumbSizeHeight = thumbRect(forBounds: bounds, trackRect:trackRect(forBounds: bounds), value:0).size.height
//        let thumbPosition = thumbSizeHeight + (percentage * (bounds.size.width - (2 * thumbSizeHeight)))
//        let touchLocation = touch.location(in: self)
//        return touchLocation.x <= (thumbPosition + thumbTouchSize.width) && touchLocation.x >= (thumbPosition - thumbTouchSize.width)
//    }
}
