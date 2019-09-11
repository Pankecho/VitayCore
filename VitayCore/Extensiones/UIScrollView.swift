//
//  UIScrollView.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation

public extension UIScrollView{
    func resizeScrollViewContentSize() {
        var contentRect = CGRect.zero
        for view in self.subviews {
            contentRect = contentRect.union(view.frame)
        }
        self.contentSize = contentRect.size
    }
}
