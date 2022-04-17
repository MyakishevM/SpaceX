//
//  File.swift
//  SpaceXProject
//
//  Created by Maxim Myakishev on 08.04.2022.
//

import SwiftUI

struct RocketDTO: Codable, Identifiable {
    
    var rocketID: String?
    var pageNumber = 0
    var id = UUID()
    let height: Diameter?
    let diameter: Diameter?
    let mass: Mass?
    let payloadWeights: [PlayloadWeight]?
    let firstFlight: String?
    let country: String?
    let costPerLaunch: Int?
    let firstStage: FirstStage?
    let secondStage: SecondStage?
    let flickrImages: [String]
    let name: String?

    enum CodingKeys: String, CodingKey {
        case height, diameter, mass, country, name
        case payloadWeights = "payload_weights"
        case firstFlight = "first_flight"
        case rocketID = "id"
        case costPerLaunch = "cost_per_launch"
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case flickrImages = "flickr_images"
    }
}

struct Diameter: Codable {
    let meters: Double?
    let feet: Double?
}

struct Mass: Codable {
    let kg: Int
    let lb: Int
}

struct PlayloadWeight: Codable {
    let id: String?
    let name: String?
    let kg: Int?
    let lb: Int?
}

struct FirstStage: Codable {
    let engines: Int?
    let fuelAmountTons: Double?
    let burnTimeSec: Int?

    enum CodingKeys: String, CodingKey {
        case engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSec = "burn_time_sec"
    }
}

struct SecondStage: Codable {
    let engines: Int?
    let fuelAmountTons: Double?
    let burnTimeSec: Int?

    enum CodingKeys: String, CodingKey {
        case engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSec = "burn_time_sec"
    }
}
