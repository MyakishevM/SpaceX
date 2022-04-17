//
//  HorizontalElementsView.swift
//  SpaceXProject
//
//  Created by Maxim Myakishev on 13.04.2022.
//

import SwiftUI

struct HorizontalElementsView: View {

    var height: Double?
    var diameter: Double?
    var massInLb: Int?
    var payloadWeightInLb: Int?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing:12) {
                HorizontalParametersView(value: String(format: "%.1f", height ?? ""),
                                         inscription: "Высота, ft")

                HorizontalParametersView(value: String(format: "%.1f", diameter ?? ""),
                                         inscription: "Диаметр, ft")

                HorizontalParametersView(value: String(massInLb ?? 0),
                                         inscription: "Масса, lb", isSeparated: true)

                HorizontalParametersView(value: String(payloadWeightInLb ?? 0),
                                         inscription: "Нагрузка, lb")
            }
        }
    }
}
struct HorizontalElementsView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalElementsView()
    }
}
