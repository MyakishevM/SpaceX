//
//  InfoView.swift
//  SpaceXProject
//
//  Created by Maxim Myakishev on 13.04.2022.
//

import SwiftUI

struct InfoView: View {

    var firstFlightDate: String?
    var country: String?
    var flightCost: Int?
    var flightCostInMln: Int? {
        guard let cost = flightCost else { return 0 }
        return cost / 1000000
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            InfoParametersView(value: firstFlightDate ?? "",
                               characteristic: "Первый запуск",
                               isDate: true)

            InfoParametersView(value: country ?? "",
                               characteristic: "Страна")

            InfoParametersView(value: "$\(flightCostInMln ?? 0)млн", characteristic: "Стоимость запуска")
        }.padding(.top, 40)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
