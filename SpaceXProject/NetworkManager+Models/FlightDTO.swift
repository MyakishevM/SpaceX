//
//  File.swift
//  SpaceXProject
//
//  Created by Maxim Myakishev on 13.04.2022.
//

import Foundation

struct Docs: Codable {
    let docs: [FlightDTO]?
}
struct FlightDTO: Codable, Identifiable {
    
    var id = UUID()
    let success: Bool?
    let name: String?
    let dateUTC: String?

    enum CodingKeys: String, CodingKey {
        case name, success
        case dateUTC = "date_local"
    }
}
