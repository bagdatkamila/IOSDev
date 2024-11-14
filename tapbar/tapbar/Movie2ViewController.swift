//
//  Movie2ViewController.swift
//  tapbar
//
//  Created by Камила Багдат on 13.11.2024.
//

import UIKit

class Movie2ViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var coverImage: UIImageView!
    
    private var inputModel: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        titleLabel.text = inputModel?.title
        descriptionLabel.text = inputModel?.description
        coverImage.image = inputModel?.image
    }
    
    func configure(with model: Movie?) {
        self.inputModel = model
    }
}

