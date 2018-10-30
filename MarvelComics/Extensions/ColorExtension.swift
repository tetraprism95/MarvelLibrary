//
//  UIColorExtension.swift
//  MarvelComics
//
//  Created by Nuri Chun on 9/4/18.
//  Copyright © 2018 tetra. All rights reserved.
//

import UIKit

extension UIColor {
    
    static let darkBlue = UIColor(red: 9/255, green: 45/255, blue: 64/255, alpha: 1)
    static let lightBlue = UIColor.rgb(r: 218, g: 235, b: 244)
    static let lightRed = UIColor(red: 247/255, green: 66/255, blue: 82/255, alpha: 1)
    static let tealColor = UIColor(red: 48/255, green: 164/255, blue: 182/255, alpha: 1)
    static let darkRed = UIColor.rgb(r: 148, g: 22, b: 22)
    static let marvelDarkGray = UIColor.rgb(r: 122, g: 115, b: 115)
    static let marvelLightGray = UIColor.rgb(r: 199, g: 187, b: 187)
    
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: r / 255, green: g / 255, blue: b / 255, alpha: alpha)
    }
}

