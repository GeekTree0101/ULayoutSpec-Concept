//
//  UILayoutSpec.swift
//
//  Created by Geektree0101.
//  Copyright(C) 2018 Geektree0101. All rights reserved.
//

import Foundation
import UIKit
import YogaKit

public protocol UILayoutSpec {
    var view: UIView { get set }
}

extension UILayoutSpec {
    public var style: YGLayout {
        return view.style
    }
}

protocol UILayoutSpecRenderer {
    func render() -> UILayoutSpec
}

public struct UILayoutElement: UILayoutSpec {
    public var view: UIView
    
    public init(_ view: UIView) {
        self.view = view
        self.view.style.isEnabled = true
    }
}
