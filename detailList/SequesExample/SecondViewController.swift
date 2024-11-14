//
//  SecondViewController.swift
//  detailList
//
//  Created by Камила Багдат on 07.11.2024.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var coverImage: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
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
