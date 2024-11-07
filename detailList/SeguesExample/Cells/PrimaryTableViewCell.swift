//
//  PrimaryTableViewCell.swift
//  detailList
//
//  Created by Камила Багдат on 07.11.2024.
//

import UIKit

class PrimaryTableViewCell: UITableViewCell {

    @IBOutlet private weak var coverImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(_ model: VideoGames) {
        titleLabel.text = model.title
        coverImage.image = model.image
    }

}
