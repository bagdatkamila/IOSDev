//
//  Hero.swift
//  heroRandomizer
//
//  Created by Камила Багдат on 18.11.2024.
//

import UIKit

struct Hero: Decodable {
    let name: String
    let images: HeroImage
    let slug: String
    let powerstats: PowerStats
    let appearance: HeroAppearance
    let biography: HeroBiography
    let work: HeroWork
    
    struct HeroImage: Decodable {
        let sm: String
    }

    struct PowerStats: Decodable {
        let intelligence: Int
        let strength: Int
        let speed: Int
        let durability: Int
        let power: Int
        let combat: Int
    }
//
    struct HeroAppearance: Decodable {
        let gender: String
        let eyeColor: String
        let hairColor: String
    }
//
    struct HeroBiography: Decodable {
        let alterEgos: String
        let placeOfBirth: String
        let firstAppearance: String
    }
//
    struct HeroWork: Decodable {
        let occupation: String
    }

}

