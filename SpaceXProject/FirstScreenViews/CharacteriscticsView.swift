//
//  SwiftUIView.swift
//  SpaceXProject
//
//  Created by Maxim Myakishev on 10.04.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacteriscticsView: View {
    
    //MARK: -Image and name
    var stringImageURL: String?
    var rocketName: String?
    var rocketID: String?

    //MARK: -Horizontal Scrolling
    var height: Double?
    var diameter: Double?
    var massInLb: Int?
    var payloadWeightInLb: Int?

    //MARK: -General characteristics
    var firstFlight: String?
    var country: String?
    var flightCost: Int?
    var flightCostInMln: Int? {
        guard let cost = flightCost else { return 0 }
        return cost / 1000000
    }

    //MARK: -First Stage
    var firstStageEnginesQuantity: Int?
    var firstStageFuelAmountTons: Double?
    var firstStageBurnTimeSec: Int?

    //MARK: -Second Stage
    var secondStageEnginesQuantity: Int?
    var secondStageFuelAmountTons: Double?
    var secondtageBurnTimeSec: Int?

    private let firstStageTitle = "ПЕРВАЯ СТУПЕНЬ"
    private let secondStageTitle = "ВТОРАЯ СТУПЕНЬ"

    var body: some View {
        ZStack {
            WebImage(url: URL(string: stringImageURL ?? ""))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: .infinity)
                .clipped()
                .padding(.bottom, UIScreen.main.bounds.height / 1.85)
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    ZStack {
                        ScrollView {

                            //MARK: -Rocket name and button
                            RocketNameAndSettingsButtonView(rocketName: rocketName)
                                .padding(.bottom, 32)

                            //MARK: -Horizontal scroll elements
                            HorizontalElementsView(height: height, diameter: diameter, massInLb: massInLb , payloadWeightInLb: payloadWeightInLb)

                            //MARK: -Info
                            InfoView(firstFlightDate: firstFlight, country: country, flightCost: flightCost)

                            //MARK: -Stages
                            VStack {
                                FirstStageView(enginesQuantity: firstStageEnginesQuantity, fuelAmountTons: firstStageFuelAmountTons, burnTimeSec: firstStageBurnTimeSec, title: firstStageTitle)
                                SecondStageView(enginesQuantity: secondStageEnginesQuantity, fuelAmountTons: secondStageFuelAmountTons, burnTimeSec: secondtageBurnTimeSec, title: secondStageTitle)
                            }.padding(.top, 40)

                            //MARK: Button
                            NavigationLink(destination:SecondScreenMainView(title: rocketName ?? "" ,currentID: rocketID ?? "")) {
                                Text("Посмотреть запуски")
                                    .font(.custom("LabGrotesqueK-Bold", size: 16))
                                    .padding()
                                    .background(Color("DarkGray"))
                                    .foregroundColor(Color("White"))
                                    .cornerRadius(10)
                            }
                            .padding(.top, 40)
                            .padding(.bottom, UIScreen.main.bounds.height / 11 + 40)

                        }.padding(.horizontal, 32)
                            .padding(.top, 48)
                            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height / 1.75)
                            .background(Color("Black"))
                            .cornerRadius(32)
                    }
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CharacteriscticsView()
    }
}
