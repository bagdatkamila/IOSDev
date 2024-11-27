//
//  ViewController.swift
//  heroRandomizer
//
//  Created by Камила Багдат on 18.11.2024.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroSpeed: UILabel!
    @IBOutlet weak var heroSlug: UILabel!
    @IBOutlet weak var heroGender: UILabel!
    @IBOutlet weak var heroEyeColor: UILabel!
    @IBOutlet weak var heroHairColor: UILabel!
    @IBOutlet weak var heroAlterEgos: UILabel!
    @IBOutlet weak var heroPlaceOfBirth: UILabel!
    @IBOutlet weak var heroOccupation: UILabel!
    @IBOutlet weak var heroFirstAppearance: UILabel!
    
    private let api = "https://akabab.github.io/superhero-api/api/all.json"
    private var heroes: [Hero] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func HeroButtonDidTap(_ sender: UIButton) {
        if heroes.isEmpty {
            fetchHero()
        } else {
            let randomHero = heroes.randomElement()!
            configure(hero: randomHero)
        }
    }
    
    private func fetchHeroAsync() async {
        let result = await AF.request(api).serializingDecodable([Hero].self).result
        switch result {
        case .success(let heroes):
            self.heroes = heroes
        case .failure(let error):
            print(error)
        }
    }
    
    private func fetchHero() {
        AF.request(api).responseDecodable(of: [Hero].self) { response in
            switch response.result {
            case .success(let heroes):
                self.heroes = heroes
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func configure(hero: Hero) {
        heroName.text = hero.name
        heroOccupation.text = hero.work.occupation
        heroFirstAppearance.text = hero.biography.firstAppearance
        heroSlug.text = hero.slug
        heroSpeed.text = "\(hero.powerstats.speed)"
        heroGender.text = hero.appearance.gender
        heroEyeColor.text = hero.appearance.eyeColor
        heroHairColor.text = hero.appearance.hairColor
        heroAlterEgos.text = hero.biography.alterEgos
        heroPlaceOfBirth.text = hero.biography.placeOfBirth
        heroImage.kf.setImage(with: URL(string: hero.images.sm))
    }

//    private func randomize() {
//        let session = URLSession.shared
//        let urlString = "https://akabab.github.io/superhero-api/api/all.json"
//        
//        guard let url = URL(string: urlString) else { return }
//        
//        let urlRequest = URLRequest(url: url)
//        
//        let task = session.dataTask(with: urlRequest) { data, response, error in
//            if let error {
//                print("Error: \(error)")
//                return
//            } else {
//                guard let data else { return }
//                self.decodeHeroResponse(heroData:  data)
//            }
//        }
//        task.resume()
//    }
    
//    private func decodeHeroResponse(heroData: Data) {
//        do {
//            let heroes = try JSONDecoder().decode([Hero].self, from: heroData)
//            
//            guard let selectedHero = heroes.randomElement() else { return }
//
//            DispatchQueue.main.async {
//                self.updateUI(selectedHero: selectedHero)
//            }
//        } catch {
//            print("E123123 \(error.localizedDescription)")
//        }
//    }
    
//    private func updateUI(selectedHero: Hero) {
//        self.heroName.text = selectedHero.name
//        self.heroSlug.text = selectedHero.slug
//        self.heroSpeed.text = "\(selectedHero.powerstats.speed)"
//        self.heroAlterEgos.text = selectedHero.biography.alterEgos
//        self.heroGender.text = selectedHero.appearance.gender
//        self.heroEyeColor.text = selectedHero.appearance.eyeColor
//        self.heroPlaceOfBirth.text = selectedHero.biography.placeOfBirth
//        self.heroHairColor.text = selectedHero.appearance.hairColor
//        self.heroFirstAppearance.text = selectedHero.biography.firstAppearance
//        self.heroOccupation.text = selectedHero.work.occupation
//
//        
//        fetchHeroImage(imageString: selectedHero.images.sm)
//    }
    
    private func fetchHeroImage(imageString: String) {
        guard let url = URL(string: imageString) else {
            return
        }

        DispatchQueue.global().async {
            let imageData = try! Data(contentsOf: url)
            DispatchQueue.main.async {
                self.heroImage.image = UIImage(data: imageData)
            }
        }
    }
}
