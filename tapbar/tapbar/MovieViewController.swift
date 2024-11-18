//
//  MovieViewController.swift
//  tapbar
//
//  Created by Камила Багдат on 13.11.2024.
//

import UIKit

class MovieViewController: UIViewController {
    
    private var movies: [Movie] = [
        Movie(title: "Inception", image: .inception, description: "A mind-bending science fiction thriller where a skilled thief, who steals secrets through dream infiltration, is given a chance to have his past crimes forgiven by planting an idea in someone’s subconscious."),
        Movie(title: "The Godfather", image: .godfather, description: "A classic crime drama that chronicles the powerful Italian-American crime family of Don Vito Corleone as the youngest son steps in to run the empire after his father is attacked."),
        Movie(title: "The Dark Knight", image: .darkKnight, description: "A gripping superhero film where Batman faces his greatest challenge yet as the Joker, a criminal mastermind, unleashes chaos on Gotham City."),
        Movie(title: "Titanic", image: .titanic, description: "A sweeping romantic drama set against the ill-fated maiden voyage of the RMS Titanic, focusing on the forbidden love story between Jack, a poor artist, and Rose, a young aristocrat."),
        Movie(title: "The Shawshank Redemption",image: .shawshank,  description: "A powerful drama about a man wrongly imprisoned for the murder of his wife and her lover, who finds hope and friendship during his long sentence at Shawshank State Penitentiary."),
        Movie(title: "Jurassic Park", image: .jurassic, description: "A thrilling adventure where a group of scientists and visitors must survive when cloned dinosaurs escape containment on a remote island theme park."),
        Movie(title: "Forrest Gump", image: .forest, description: "An inspiring story following the extraordinary life of Forrest Gump, a kind-hearted man from Alabama, whose unique journey intertwines with key historical moments."),
        Movie(title: "The Matrix", image: .matrix, description: "A revolutionary science fiction action film where a computer hacker learns that reality is a simulated world controlled by sentient machines, and he joins a rebellion to free humanity."),
        Movie(title: "Star Wars: Episode IV - A New Hope", image: .starWars, description: "An epic space opera where a young farm boy named Luke Skywalker joins forces with a band of rebels to destroy the Death Star and defeat the evil Galactic Empire."),
        Movie(title: "Avengers: Endgame", image: .avengers, description: "The culmination of the Marvel Cinematic Universe's Infinity Saga, where the remaining Avengers assemble to undo the destruction caused by Thanos and bring back those who were lost.")
    ]
    @IBOutlet weak var tableView: UITableView!
    
    private var selectedMovie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "MovieTableViewCell")
//        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        
        tableView.register(UINib(nibName: "MovieTableViewCellTest", bundle: nil), forCellReuseIdentifier: "MovieTableViewCellTest")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? Movie2ViewController else { return }
        destVC.configure(with: selectedMovie)
//        destVC.configure(with: selectedMovie ?? .init(title: "", image: UIImage(systemName: "doc.questionmark.fill")!, description: ""))
    }
    
    
}

extension MovieViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMovie = movies[indexPath.row]
        performSegue(withIdentifier: "goToDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCellTest", for: indexPath) as! MovieTableViewCellTest
        let currentModel = movies[indexPath.row]
        cell.configure(with: currentModel)
        return cell
    }
}
