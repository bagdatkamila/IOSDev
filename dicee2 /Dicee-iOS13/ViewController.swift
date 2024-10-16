//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let diceImages = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]

    @IBOutlet weak var RollDice: UIButton!
    @IBOutlet weak var DiceOne: UIImageView!
    @IBOutlet weak var DiceFive: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func rollDiceButtonTapped(_ sender: UIButton) {
            let randomDiceIndex1 = Int.random(in: 0...5)
            let randomDiceIndex2 = Int.random(in: 0...5)

            DiceOne.image = UIImage(named: diceImages[randomDiceIndex1])
            DiceFive.image = UIImage(named: diceImages[randomDiceIndex2])
        }


}

