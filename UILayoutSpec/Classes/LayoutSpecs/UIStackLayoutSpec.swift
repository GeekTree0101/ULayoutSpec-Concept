//
//  UIStackLayoutSpec.swift
//
//  Created by Geektree0101.
//  Copyright(C) 2018 Geektree0101. All rights reserved.
//

import Foundation
import UIKit
import YogaKit

public struct UIStackLayoutSpec: UILayoutSpec {
    public var view: UIView
    public var childs: [UILayoutSpec]
    public var direction: YGFlexDirection
    public var spacing: CGFloat = 0.0
    public var alignContent: YGAlign
    public var alignItems: YGAlign
    
    public init(containerView: UIView,
                childs: [UILayoutSpec],
                direction: YGFlexDirection,
                spacing: CGFloat,
                alignContent: YGAlign,
                alignItems: YGAlign) {
        self.view = containerView
        self.childs = childs
        self.direction = direction
        self.spacing = spacing
        self.alignContent = alignContent
        self.alignItems = alignItems
    }
}

extension UIStackLayoutSpec: UILayoutSpecRenderer {
    func render() -> UILayoutSpec {
        self.view.style.isEnabled = true
        for child in childs {
            switch alignContent {
            case .flexStart:
                child.view.style.marginRight = YGValue(spacing)
                child.view.style.marginLeft = 0.0
            case .flexEnd:
                child.view.style.marginLeft = YGValue(spacing)
                child.view.style.marginRight = 0.0
            case .spaceBetween, .spaceAround:
                if let lastChild = childs.last, child.view != lastChild.view {
                    child.view.style.marginRight = YGValue(spacing)
                    child.view.style.marginLeft = 0.0
                }
            default:
                child.view.style.marginLeft = 0.0
                child.view.style.marginRight = 0.0
            }
            
            if let layout = (child as? UILayoutSpecRenderer)?.render() {
                self.view.addSubview(layout.view)
            } else {
                self.view.addSubview(child.view)
            }
        }
        self.view.style.flexDirection = direction
        self.view.style.alignItems = alignItems
        self.view.style.alignContent = alignContent
        return self
    }
}
