//
//  VideoGame.swift
//  favourite game
//
//  Created by Камила Багдат on 25.10.2024.
//

import UIKit

class VideoGame: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    override func setSelected(_ selected: Bool, animated: Bool) {
    }
    
        super.setSelected(selected, animated: animated)}
    
    func configure(with game: Game) {
        textLabel?.text = game.name
        imageView?.image = UIImage(named: game.imageName)
        platformLabel?.text = game.platform
        releaseLabel.text = game.releaseDate
    }
}
