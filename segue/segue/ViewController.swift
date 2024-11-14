//
//  ViewController.swift
//  segue
//
//  Created by Камила Багдат on 14.11.2024.
//

import UIKit

class ViewController: UIViewController {

    private var videoGames: [VideoGames] = [
        VideoGames(
            title: "Animal Crossing: New Horizons",
            description: "Step into your own paradise on a deserted island and build the life of your dreams! Customize your home, make friends with adorable villagers, and enjoy a relaxing experience full of creativity and charm",
            releaseDate: "2020",
            rating: "9.0",
            image: .animalcrossing
        ),
        VideoGames(
            title: "Cyberpunk 2077",
            description: "Dive into the gritty, neon-lit world of Night City, a sprawling metropolis driven by technology and corruption. Play as V, a mercenary outlaw, customize your cybernetic upgrades, and make choices that shape your story in this immersive RPG",
            releaseDate: "2020",
            rating: "7.4",
            image: .cyberpank
        ),
        VideoGames(
            title: "Detroit: Become Human",
            description: "Explore a futuristic world where androids serve humanity, and every choice you make shapes the fate of three unique characters. Experience a gripping narrative full of moral dilemmas and branching storylines",
            releaseDate: "2018",
            rating: "8.9",
            image: .detroit
        ),
        VideoGames(
            title: "God of War (2018)",
            description: "Follow Kratos and his son Atreus on a powerful journey through the Norse wilderness. Battle fierce enemies, solve puzzles, and experience a story about fatherhood, loss, and redemption in this action-packed adventure",
            releaseDate: "2018",
            rating: "9.3",
            image: .godofwar
        ),
        VideoGames(
            title: "Halo Infinite",
            description: "Join Master Chief on his most epic quest yet to save humanity. Explore the expansive open-world of Zeta Halo, take on new challenges, and experience breathtaking combat in this iconic first-person shooter",
            releaseDate: "2021",
            rating: "7.9",
            image: .haloinfinite
        ),
        VideoGames(
            title: "Red Dead Redemption 2",
            description: "Immerse yourself in the breathtaking and unforgiving world of the American Wild West. Follow the story of Arthur Morgan, an outlaw on the run, as you experience an epic tale of loyalty, betrayal, and survival",
            releaseDate: "2018",
            rating: "8.3",
            image: .reddead
        ),
        VideoGames(
            title: "The Sims 4",
            description: "Create and control unique Sims, build dream homes, and shape their lives in every way. From careers to relationships, experience endless possibilities and express your creativity in this life simulation game",
            releaseDate: "2014",
            rating: "8.9",
            image: .sims
        ),
        VideoGames(
            title: "Spider-Man: Miles Morales",
            description: "Swing into action as Miles Morales and master his unique abilities to protect New York City. Face off against new threats and discover what it means to become your own Spider-Man in this thrilling superhero adventure",
            releaseDate: "2020",
            rating: "8.9",
            image: .spiderman
        ),
        VideoGames(
            title: "Super Mario Odyssey",
            description: "Embark on a globe-trotting adventure with Mario and his new friend, Cappy! Explore diverse kingdoms, collect Power Moons, and save Princess Peach from Bowser's wedding plans in this imaginative 3D platformer",
            releaseDate: "2017",
            rating: "7.3",
            image: .supermario
        ),
        VideoGames(
            title: "The Legend of Zelda: Breath of the Wild",
            description: "Discover a vast and beautifully crafted world in this groundbreaking open-world adventure. Explore, fight, and solve puzzles as Link, and uncover the mysteries of Hyrule in a journey full of wonder and freedom",
            releaseDate:   "2017",
            rating: "8.8",
            image: .zelda
        )
    ]

    @IBOutlet private weak var tableView: UITableView!
    
    private var selectedGame: VideoGames?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? SecondViewController else {
            return
        }
        destVC.configure(with: selectedGame)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedGame = videoGames[indexPath.row]
        performSegue(withIdentifier: "goToDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoGames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "primaryCell", for: indexPath) as! VideoGamesTableViewCell
        let currentModel = videoGames[indexPath.row]
        cell.configure(currentModel)
        return cell
    }
}

