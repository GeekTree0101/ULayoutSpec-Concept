//
//  YGLayout+UILayoutSpec.swift
//
//  Created by Geektree0101.
//  Copyright(C) 2018 Geektree0101. All rights reserved.
//

import Foundation
import YogaKit

extension YGLayout {
    public var preferredSize: CGSize {
        set(size) {
            self.width = YGValue(size.width)
            self.height = YGValue(size.height)
        }
        get {
            return CGSize(width: CGFloat(self.width.value),
                          height: CGFloat(self.height.value))
        }
    }
}
