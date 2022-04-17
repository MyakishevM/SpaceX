//
//  FirstStageView.swift
//  SpaceXProject
//
//  Created by Maxim Myakishev on 14.04.2022.
//

import SwiftUI

struct FirstStageView: View, StagesProtocol {

    var enginesQuantity: Int?
    var fuelAmountTons: Double?
    var burnTimeSec: Int?
    var title: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.custom("LabGrotesqueK-Bold", size: 16))
                .foregroundColor(Color(#colorLiteral(red: 0.9719485641,
                                                     green: 0.9719484448,
                                                     blue: 0.9719484448,
                                                     alpha: 1)))

            InfoParametersView(value: "\(enginesQuantity ?? 0)",
                               characteristic: "Количество двигателей",
                               isTextBold: true).padding(.trailing, 32)

            InfoParametersView(value: "\(fuelAmountTons ?? 0)",
                               characteristic: "Количество топлива",
                               isTextBold: true, isWithSecMetrics: false)

            InfoParametersView(value: "\(burnTimeSec ?? 0)",
                               characteristic: "Время сгорания",
                               isTextBold: true, isWithSecMetrics: true)

        }
    }
}

struct FirstStageView_Previews: PreviewProvider {
    static var previews: some View {
        FirstStageView()
    }
}
