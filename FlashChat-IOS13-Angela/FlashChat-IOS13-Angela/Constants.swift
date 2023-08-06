//
//  Constants.swift
//  FlashChat-IOS13-Angela
//
//  Created by Павел Грицков on 16.03.23.
//

import Foundation

struct K {
    static let appName = "Flash⚡️Chat"
    static let cellIdentifier = "MessageViewCell"
    static let cellNibName = "MessageViewCell"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
