//
//  MessageViewCell.swift
//  FlashChat-IOS13-Angela
//
//  Created by Павел Грицков on 17.03.23.
//

import UIKit

class MessageViewCell: UITableViewCell {
    
    
    @IBOutlet weak var messageBubbleView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        messageBubbleView.layer.cornerRadius = messageBubbleView.frame.size.height / 2.5
    }
    
    func configure(text: String, IsCurrentUser: Bool) {
        messageLabel.text = text
        
        if IsCurrentUser {
            rightImageView.isHidden = false
            leftImageView.isHidden = true
            messageBubbleView.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            messageLabel.textColor = UIColor(named: K.BrandColors.purple)
        } else {
            rightImageView.isHidden = true
            leftImageView.isHidden = false
            messageBubbleView.backgroundColor = UIColor(named: K.BrandColors.purple)
            messageLabel.textColor = UIColor(named: K.BrandColors.lightPurple)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
