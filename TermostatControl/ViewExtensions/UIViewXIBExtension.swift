//
//  UIViewXIBExtension.swift
//  TermostatControl
//
//  Created by Vitalii Maksymliuk on 1/25/19.
//  Copyright © 2019 Vitalii Maksymliuk. All rights reserved.
//

import UIKit

extension UIView {

    // Add Self Nibfile
    @discardableResult
    func addSelfNibUsingConstraints(nibName: String) -> UIView? {
        guard let nibView = loadSelfNib(nibName: nibName) else {
            assert(true, "---- UIView Extension Nib file not found ----")
            return nil
        }
        
        addSubviewUsingConstraints(view: nibView)
        return nibView
    }
    
    @discardableResult
    func addSelfNibUsingConstraints() -> UIView? {
        guard let nibView = loadSelfNib() else {
            assert(true, "---- UIView Extension Nib file not found ----")
            return nil
        }
        
        addSubviewUsingConstraints(view: nibView)
        return nibView
    }
    
    // Load Nibfile
    func loadSelfNib() -> UIView? {
        let nibName = String(describing: type(of: self))
        if let nibFiles = Bundle.main.loadNibNamed(nibName, owner: self, options: nil),
            nibFiles.count > 0 {
            return nibFiles.first as? UIView
        }
        return nil
    }
    
    func loadSelfNib(nibName: String) -> UIView? {
        if let nibFiles = Bundle.main.loadNibNamed(nibName, owner: self, options: nil), nibFiles.count > 0 {
            return nibFiles.first as? UIView
        }
        return nil
    }
    
    // Add subview
    func addSubviewUsingConstraints(view: UIView,
                                    insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        NSLayoutConstraint.activate([view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets.left),
                                     view.topAnchor.constraint(equalTo: topAnchor, constant: insets.top),
                                     trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: insets.right),
                                     bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: insets.bottom)])
    }
    
    func addSuperviewUsingConstraints(superview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        superview.addSubview(self)
        let views = ["view": self]
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|",
                                                                options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                metrics: nil,
                                                                views: views))
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|",
                                                                options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                metrics: nil,
                                                                views: views))
    }
}
