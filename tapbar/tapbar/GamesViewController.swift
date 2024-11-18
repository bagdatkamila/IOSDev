//
//  GamesViewController.swift
//  tapbar
//
//  Created by Камила Багдат on 13.11.2024.
//

import UIKit

class GamesViewController: UIViewController{
    
    private var games: [Games] = [
        Games(
            title: "Animal Crossing: New Horizons",
            image: .animalcrossing,
            description: "Step into your own paradise on a deserted island and build the life of your dreams! Customize your home, make friends with adorable villagers, and enjoy a relaxing experience full of creativity and charm"
        ),
        Games(
            title: "Cyberpunk 2077",
            image: .cyberpank,
            description: "Dive into the gritty, neon-lit world of Night City, a sprawling metropolis driven by technology and corruption. Play as V, a mercenary outlaw, customize your cybernetic upgrades, and make choices that shape your story in this immersive RPG"
        ),
        Games(
            title: "Detroit: Become Human",
            image: .detroit,
            description: "Explore a futuristic world where androids serve humanity, and every choice you make shapes the fate of three unique characters. Experience a gripping narrative full of moral dilemmas and branching storylines"
        ),
        Games(
            title: "God of War (2018)",
            image: .godofwar,
            description: "Follow Kratos and his son Atreus on a powerful journey through the Norse wilderness. Battle fierce enemies, solve puzzles, and experience a story about fatherhood, loss, and redemption in this action-packed adventure"
        ),
        Games(
            title: "Halo Infinite",
            image: .haloinfinite,
            description: "Join Master Chief on his most epic quest yet to save humanity. Explore the expansive open-world of Zeta Halo, take on new challenges, and experience breathtaking combat in this iconic first-person shooter"
        ),
        Games(
            title: "Red Dead Redemption 2",
            image: .reddead,
            description: "Immerse yourself in the breathtaking and unforgiving world of the American Wild West. Follow the story of Arthur Morgan, an outlaw on the run, as you experience an epic tale of loyalty, betrayal, and survival"
        ),
        Games(
            title: "The Sims 4",
            image: .sims,
            description: "Create and control unique Sims, build dream homes, and shape their lives in every way. From careers to relationships, experience endless possibilities and express your creativity in this life simulation game"
        ),
        Games(
            title: "Spider-Man: Miles Morales",
            image: .spiderman,
            description: "Swing into action as Miles Morales and master his unique abilities to protect New York City. Face off against new threats and discover what it means to become your own Spider-Man in this thrilling superhero adventure"
        ),
        Games(
            title: "Super Mario Odyssey",
            image: .supermario,
            description: "Embark on a globe-trotting adventure with Mario and his new friend, Cappy! Explore diverse kingdoms, collect Power Moons, and save Princess Peach from Bowser's wedding plans in this imaginative 3D platformer"
        ),
        Games(
            title: "The Legend of Zelda: Breath of the Wild",
            image: .zelda,
            description: "Discover a vast and beautifully crafted world in this groundbreaking open-world adventure. Explore, fight, and solve puzzles as Link, and uncover the mysteries of Hyrule in a journey full of wonder and freedom"
        )
        
    ]
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var selectedGame: Games?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(GamesTableViewCell.self, forCellReuseIdentifier: "GamesTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? Games2ViewController else { return }
        destVC.configure(with: selectedGame)
//        destVC.configure(with: selectedGame ?? .init(title: "", image: UIImage(systemName: "doc.questionmark.fill")!, description: ""))
    }
    
}

extension GamesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedGame = games[indexPath.row]
        performSegue(withIdentifier: "goToDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension GamesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        games.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GamesTableViewCell", for: indexPath) as! GamesTableViewCell
        let currentModel = games[indexPath.row]
        print(currentModel)
        cell.configure(currentModel)
        return cell
    }
}
