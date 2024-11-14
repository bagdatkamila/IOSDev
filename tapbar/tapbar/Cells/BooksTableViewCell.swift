//
//  BooksTableViewCell.swift
//  tapbar
//
//  Created by Камила Багдат on 13.11.2024.
//

import UIKit

class BooksTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var coverImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(_ model: Books) {
        titleLabel?.text = model.title
        coverImage?.image = model.image
    }
}
