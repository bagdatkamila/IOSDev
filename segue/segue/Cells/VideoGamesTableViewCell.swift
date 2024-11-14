//
//  VideoGamesTableViewCell.swift
//  segue
//
//  Created by Камила Багдат on 14.11.2024.
//

import UIKit

class VideoGamesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

    func configure(_ model: VideoGames){
        titleLabel.text = model.title
        coverImage.image = model.image
    }
}
