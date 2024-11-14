//
//  Games2ViewController.swift
//  tapbar
//
//  Created by Камила Багдат on 13.11.2024.
//

import UIKit

class Games2ViewController: UIViewController {
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    private var inputModel: Games?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = inputModel?.title
        descriptionLabel.text = inputModel?.description
        coverImage.image = inputModel?.image
    }
    
    func configure(with model: Games?) {
        self.inputModel = model
    }
}
