//
//  PostCell.swift
//  Instagrammer2
//
//  Created by Carly Burroughs on 3/8/16.
//  Copyright © 2016 Carly Burroughs. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostCell: UITableViewCell {

    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var postImageView: PFImageView!
    
    var post: PFObject! {
        didSet {
            print(post)
            postImageView.file = post["media"] as? PFFile
            postImageView.loadInBackground()
            captionLabel.text = post["caption"] as? String
            authorLabel.text = (post["author"] as? PFUser)?.username
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

        
}
