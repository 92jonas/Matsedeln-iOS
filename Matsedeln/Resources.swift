//
//  Strings.swift
//  Matsedeln
//
//  Created by Jonas Jacobsson on 2016-03-02.
//  Copyright © 2016 Jonas Jacobsson. All rights reserved.
//

import Foundation
import UIKit


import Foundation
import UIKit

extension UIColor {
    convenience init(hex : Int) {
        let blue = CGFloat(hex & 0xFF)
        let green = CGFloat((hex >> 8) & 0xFF)
        let red = CGFloat((hex >> 16) & 0xFF)
        self.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1)
    }
}


struct DepthColor {
    enum Depth {
        case Foreground, Background
    }
    
    let foreground: UIColor
    let background: UIColor
    
    init(foreground: Int, background: Int) {
        self.foreground = UIColor(hex: foreground)
        self.background = UIColor(hex: background)
    }
    
    init() {
        self.foreground = UIColor(hex: 0xFFFFFF)
        self.background = UIColor(hex: 0)
    }
    
    func colorForDepth(depth : Depth) -> UIColor {
        switch(depth) {
        case .Foreground:
            return self.foreground
        case .Background:
            return self.background
        }
    }
}

struct Resource {
    enum Purpose {
        case Normal, Highlighted, Disabled
    }
    
    let normal : DepthColor
    let highlighted : DepthColor
    let disabled : DepthColor
    
    init(normal: DepthColor = DepthColor(), highlighted: DepthColor = DepthColor(), disabled: DepthColor = DepthColor()) {
        self.normal = normal
        self.highlighted = highlighted
        self.disabled = disabled
    }
    
    func depthColorForPurpose(purpose : Purpose) -> DepthColor {
        switch(purpose) {
        case .Normal:
            return self.normal
        case .Highlighted:
            return self.highlighted
        case .Disabled:
            return self.disabled
        }
    }
    
    func color(purpose : Purpose = .Normal, depth: DepthColor.Depth = .Foreground) -> UIColor {
        return self.depthColorForPurpose(purpose).colorForDepth(depth)
    }
    
    
    
    
    
    ////////////////////////////////
    // Different colors for buttons
    ////////////////////////////////
    //                                Text color          Button color
    //                                     |                    |
    //                                     v                    v
    // normal: DepthColor(foreground: 0xFFFFFF, background: 0xD9910B)
    
    static func btnColor() -> Resource {
        return Resource(
            normal: DepthColor(foreground: 0xFFFFFF, background: 0xFFFFFF),
            highlighted: DepthColor(foreground: 0x4E2A1E, background: 0xFFFFFF),
            disabled: DepthColor(foreground: 0x888888, background: 0xFFFFFF)
        )
    }
    
    
    
    ////////////////////////////////
    // The Resources
    ////////////////////////////////
    
    
    static let info: String = "Info"
    static let map: String = "Hitta hit"
    static let mealOfTheDay: String = "Dagens"
    
    static let white: UIColor = UIColor(hex: 0xFFFFFF)
    static let brown: UIColor = UIColor(hex: 0x4E2A1E) // Website brown
    static let logoBrownColor: UIColor = UIColor(hex: 0x522B20) // Logo brown
    
    
}