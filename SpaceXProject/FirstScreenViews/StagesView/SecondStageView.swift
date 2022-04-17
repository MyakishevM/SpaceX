//
//  SecondStageView.swift
//  SpaceXProject
//
//  Created by Maxim Myakishev on 14.04.2022.
//

import SwiftUI

struct SecondStageView: View, StagesProtocol {
    
    var enginesQuantity: Int?
    var fuelAmountTons: Double?
    var burnTimeSec: Int?
    var title: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.custom("LabGrotesqueK-Bold", size: 16))
                .padding(.top, 40)
                .foregroundColor(Color("ValueLabelColor"))

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


struct SecondStageView_Previews: PreviewProvider {
    static var previews: some View {
        SecondStageView()
    }
}
