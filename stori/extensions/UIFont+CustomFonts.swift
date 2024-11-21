//
//  UIFont+CustomFonts.swift
//  stori
//
//  Created by Luis Enrique Vazquez Escobar on 18/11/24.
//

import UIKit

extension UIFont {
    static var H1: UIFont {
        return UIFont(name: "Roboto-Black", size: 24) ?? UIFont.systemFont(ofSize: 24, weight: .bold)
    }

    static var H2: UIFont {
        return UIFont(name: "Roboto-Bold", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .semibold)
    }

    static var H3: UIFont {
        return UIFont(name: "Roboto-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    
    static var bodyText: UIFont {
        return UIFont(name: "Roboto-Medium", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .medium)
    }

    static var lightText: UIFont {
        return UIFont(name: "Roboto-Light", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .light)
    }

    static var tagline: UIFont {
        return UIFont(name: "Roboto-ThinItalic", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .thin)
    }
}

