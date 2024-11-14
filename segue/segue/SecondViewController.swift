//
//  SecondViewController.swift
//  segue
//
//  Created by Камила Багдат on 14.11.2024.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    private var inputModel: VideoGames?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = inputModel?.title
        descriptionLabel.text = inputModel?.description
        coverImage.image = inputModel?.image
        ratingLabel.text = inputModel?.rating
        releaseDateLabel.text = inputModel?.releaseDate
    }

    func configure(with model: VideoGames?) {
        self.inputModel = model
    }

}
