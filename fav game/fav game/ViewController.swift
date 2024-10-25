//
//  ViewController.swift
//  fav game
//
//  Created by Камила Багдат on 25.10.2024.
//

import UIKit

struct Game {
    let title: String
    let cover: UIImage
    let platform: String
    let releaseDate: String
}

class ViewController: UIViewController, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteGames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as! VideoGame
        let game = favouriteGames[indexPath.row]
        cell.configure(with: game)
        return cell
    }
    
    
    
    let favouriteGames: [Game] = [
        Game(title: "The Legend of Zelda: Breath of the Wild", cover: UIImage(named: "zelda")!, platform: "Nintendo Switch", releaseDate: "2017"),
        Game(title: "God of War (2018)", cover: UIImage(named: "godofwar")!, platform: "PlayStation 4", releaseDate: "2018"),
        Game(title: "Red Dead Redemption 2", cover: UIImage(named: "reddead")!, platform: "PlayStation 4, Xbox One, PC", releaseDate: "2018"),
        Game(title: "Animal Crossing: New Horizons", cover: UIImage(named: "animalcrossing")!, platform: "Nintendo Switch", releaseDate: "2020"),
        Game(title: "The Sims 4", cover: UIImage(named: "sims")!, platform: "PC, Mac, PlayStation 4, Xbox One", releaseDate: "2014"),
        Game(title: "Detroit: Become Human", cover: UIImage(named: "detroit")!, platform: "PlayStation 4, PC", releaseDate: "2018"),
        Game(title: "Cyberpunk 2077", cover: UIImage(named: "cyberpunk")!, platform: "PlayStation 4, PlayStation 5, Xbox One, Xbox Series X/S, PC", releaseDate: "2020"),
        Game(title: "Halo Infinite", cover: UIImage(named: "haloinfinite")!, platform: "Xbox Series X/S, Xbox One, PC", releaseDate: "2021"),
        Game(title: "Super Mario Odyssey", cover: UIImage(named: "supermario")!, platform: "Nintendo Switch", releaseDate: "2017"),
        Game(title: "Spider-Man: Miles Morales", cover: UIImage(named: "spiderman")!, platform: "PlayStation 4, PlayStation 5", releaseDate: "2020")

    ]
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}
