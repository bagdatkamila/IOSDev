//
//  MovieTableViewCellTest.swift
//  tapbar
//
//  Created by Камила Багдат on 18.11.2024.
//

import UIKit

class MovieTableViewCellTest: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with movie: Movie) {
        titleLabel?.text = movie.title
        coverImage?.image = movie.image
    }
    
}
