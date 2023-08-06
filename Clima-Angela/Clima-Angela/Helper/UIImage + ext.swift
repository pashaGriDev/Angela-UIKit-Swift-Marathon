//
//  UIImage + ext.swift
//  Clima-Angela
//
//  Created by Павел Грицков on 21.02.23.
//

import UIKit

extension UIImage {
    static func getImageWith(systemName name: String, size: CGFloat, weight: UIImage.SymbolWeight) -> UIImage? {
        let config = UIImage.SymbolConfiguration(pointSize: size, weight: weight)
        let image = UIImage(systemName: name, withConfiguration: config)
        return image
    }
}
