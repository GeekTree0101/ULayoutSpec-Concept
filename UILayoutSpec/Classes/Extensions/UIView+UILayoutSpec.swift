//
//  UIView+UILayoutSpec.swift
//
//  Created by Geektree0101.
//  Copyright(C) 2018 Geektree0101. All rights reserved.
//

import Foundation
import UIKit
import YogaKit

public protocol UILayoutSpecDelegate {
    func layoutSpec() -> UILayoutSpec
}

public protocol UILayoutSpecCompatibleProtocol {
    var style: YGLayout { get set }
    func updateLayoutSpec()
}

extension UIView: UILayoutSpecCompatibleProtocol {
    public var style: YGLayout {
        get {
            return self.yoga
        }
        set {
            
        }
    }
    
    public func updateLayoutSpec() {
        let layoutSpec = (self as? UILayoutSpecDelegate)?
            .layoutSpec()
        _ = self.drawLayoutSpec(layoutSpec)
    }
}

extension UIView {
    private func drawLayoutSpec(_ spec: UILayoutSpec?) -> Bool {
        self.style.isEnabled = true
        
        // render layout
        let layoutSpec = (spec as? UILayoutSpecRenderer)?.render()
        
        // apply
        if self is UITableViewCell || self is UICollectionViewCell {
            layoutSpec?.view.style
                .applyLayout(preservingOrigin: true,
                             dimensionFlexibility: .flexibleHeigth)
        } else {
            layoutSpec?.view.style
                .applyLayout(preservingOrigin: true)
        }
        
        return layoutSpec?.view.superview != nil
    }
}

