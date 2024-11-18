//
//  GamesTableViewCell.swift
//  tapbar
//
//  Created by Камила Багдат on 13.11.2024.
//

import UIKit

class GamesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(_ model: Games) {
        print("Configuring with title: \(model.title)")
        print("titleLabel is nil: \(titleLabel == nil)")
        print("coverImage is nil: \(coverImage == nil)")
        print(model)
        titleLabel?.text = model.title
        coverImage?.image = model.image
    }
}
