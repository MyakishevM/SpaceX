//
//  StagesProtocol.swift
//  SpaceXProject
//
//  Created by Maxim Myakishev on 14.04.2022.
//

import Foundation

protocol StagesProtocol {
    var enginesQuantity: Int? { get set }
    var fuelAmountTons: Double? { get set }
    var burnTimeSec: Int? { get set }
    var title: String { get set }
}
