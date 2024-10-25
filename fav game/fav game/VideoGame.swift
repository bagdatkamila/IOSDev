//
//  VideoGame.swift
//  fav game
//
//  Created by Камила Багдат on 25.10.2024.
//

import UIKit

class VideoGame: UITableViewCell {
    
    @IBOutlet private weak var coverImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var platformLabel: UILabel!
    @IBOutlet private weak var releaseLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with game: Game) {
        coverImage.image = game.cover
        titleLabel.text = game.title
        platformLabel.text = game.platform
        releaseLabel.text = game.releaseDate
    }
    
}
