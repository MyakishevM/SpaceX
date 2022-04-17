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
    
    var body: some View {
        NavigationView {
                if !rockets.isEmpty {
                    ZStack {
                    ScrollView {
                        TabView {
                            ForEach(rockets.indices, id: \.self) { index in
                                CharacteriscticsView(pageNumber: index, numberOfPages: rockets.count, stringImageURL: rockets[index].flickrImages.first, rocketName: rockets[index].name, rocketID: rockets[index].rocketID, height: rockets[index].height?.feet, diameter: rockets[index].diameter?.feet, massInLb: rockets[index].mass?.lb, payloadWeightInLb: rockets[index].payloadWeights?.first?.lb, firstFlight: rockets[index].firstFlight, country: rockets[index].country, flightCost: rockets[index].costPerLaunch, firstStageEnginesQuantity: rockets[index].firstStage?.engines, firstStageFuelAmountTons: rockets[index].firstStage?.fuelAmountTons, firstStageBurnTimeSec: rockets[index].firstStage?.burnTimeSec, secondStageEnginesQuantity: rockets[index].secondStage?.engines, secondStageFuelAmountTons: rockets[index].secondStage?.fuelAmountTons, secondtageBurnTimeSec: rockets[index].secondStage?.burnTimeSec)
                                    .animation(.easeIn, value: index)
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    }
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

struct PageControl: UIViewRepresentable {
    var pageNumbers = 0
var current = 0
    func makeUIView(context: UIViewRepresentableContext<PageControl>) -> UIPageControl {

        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.numberOfPages = pageNumbers
        return pageControl
    }

    func updateUIView(_ uiView: UIPageControl, context: UIViewRepresentableContext<PageControl>) {
        uiView.currentPage = current
    }
}

struct PageControllView: View {
    var index = 0
    var body: some View {
        ZStack {
            Color("LightGrey")
            PageControl(current: index)
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 11)
    }
}
