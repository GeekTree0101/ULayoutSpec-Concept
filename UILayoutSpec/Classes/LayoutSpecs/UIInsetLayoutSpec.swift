//
//  UIInsetLayoutSpec.swift
//
//  Created by Geektree0101.
//  Copyright(C) 2018 Geektree0101. All rights reserved.
//

import Foundation
import UIKit
import YogaKit

public struct UIInsetLayoutSpec: UILayoutSpec {
    public var view: UIView
    public var child: UILayoutSpec
    public var insets: UIEdgeInsets

    public init(insets: UIEdgeInsets, child: UILayoutSpec) {
        self.view = child.view
        self.child = child
        self.insets = insets
    }
}

extension UIInsetLayoutSpec: UILayoutSpecRenderer {
    func render() -> UILayoutSpec {
        self.view.style.isEnabled = true
        self.view.style.paddingTop = YGValue(insets.top)
        self.view.style.paddingBottom = YGValue(insets.bottom)
        self.view.style.paddingLeft = YGValue(insets.left)
        self.view.style.paddingRight = YGValue(insets.right)
        _ = (child as? UILayoutSpecRenderer)?.render()
        return self
    }
}
