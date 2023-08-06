//
//  ProjectSizes.swift
//  Tipsy-Angela
//
//  Created by Павел Грицков on 16.02.23.
//

import Foundation


enum Size {
    
    static let mainSpacing: CGFloat = 20
    
    enum Label {
        static let offset: CGFloat = 30
        static let height: CGFloat = 30
    }
    
    enum Button {
        static let height: CGFloat = 54
        static let heightNav: CGFloat = 58
        static let widthNavMin: CGFloat = 200
    }
    
    enum FontSize {
        static let title: CGFloat = 25
        static let textField: CGFloat = 40
        static let button: CGFloat = 35
        static let buttonNav: CGFloat = 35
    }
    
    enum StackView {
        static let offset: CGFloat = 20
    }
    
    enum TextField {
        static let offset: CGFloat = 10
        static let height: CGFloat = 48
    }
    
}
