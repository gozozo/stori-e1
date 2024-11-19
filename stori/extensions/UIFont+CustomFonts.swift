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
        return UIFont(name: "Roboto-Regular", size: 20) ?? UIFont.systemFont(ofSize: 20, weight: .semibold)
    }
    
    static var bodyText: UIFont {
        return UIFont(name: "Roboto-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .regular)
    }
}

