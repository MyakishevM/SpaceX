//
//  ContentView.swift
//  SpaceXProject
//
//  Created by Maxim Myakishev on 08.04.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct FirstScreenMainView: View {

    @State var rockets: [RocketDTO] = []
    @State var current = 0

    var body: some View {
        NavigationView {
                if !rockets.isEmpty {
                    ZStack(alignment: .bottom) {
                    ScrollView {
                        TabView(selection: $current) {
                            ForEach(rockets.indices, id: \.self) { index in
                                CharacteriscticsView(stringImageURL: rockets[index].flickrImages.first, rocketName: rockets[index].name, rocketID: rockets[index].rocketID, height: rockets[index].height?.feet, diameter: rockets[index].diameter?.feet, massInLb: rockets[index].mass?.lb, payloadWeightInLb: rockets[index].payloadWeights?.first?.lb, firstFlight: rockets[index].firstFlight, country: rockets[index].country, flightCost: rockets[index].costPerLaunch, firstStageEnginesQuantity: rockets[index].firstStage?.engines, firstStageFuelAmountTons: rockets[index].firstStage?.fuelAmountTons, firstStageBurnTimeSec: rockets[index].firstStage?.burnTimeSec, secondStageEnginesQuantity: rockets[index].secondStage?.engines, secondStageFuelAmountTons: rockets[index].secondStage?.fuelAmountTons, secondtageBurnTimeSec: rockets[index].secondStage?.burnTimeSec)

                            }
                        }
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    }
                        CustomBarIndicatorView(count: rockets.count, current: $current)
                            .animation(.easeOut, value: current)
                    }
                    .edgesIgnoringSafeArea(.all)
                }
        }
        .onAppear() {
            NetworkManager().loadRocketsData { rockets in
                self.rockets = rockets
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreenMainView()
    }
}

