//
//  Books2ViewController.swift
//  tapbar
//
//  Created by Камила Багдат on 13.11.2024.
//

import UIKit

class Books2ViewController: UIViewController {
    @IBOutlet private weak var coverImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    private var inputModel: Books?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = inputModel?.title
        descriptionLabel.text = inputModel?.description
        coverImage.image = inputModel?.image
    }
    
    func configure (with model: Books?) {
        self.inputModel = model
    }
}
