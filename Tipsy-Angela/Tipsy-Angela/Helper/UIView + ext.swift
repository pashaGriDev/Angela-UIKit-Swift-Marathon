//
//  UIView + ext.swift
//  Tipsy-Angela
//
//  Created by Павел Грицков on 15.02.23.
//

import UIKit

extension UIView {
    
    // add sub view and translatesAutoresizingMaskIntoConstraints = false
    func setupView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
