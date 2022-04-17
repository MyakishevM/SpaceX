//
//  SecondScreenMainView.swift
//  SpaceXProject
//
//  Created by Maxim Myakishev on 17.04.2022.
//

import SwiftUI

struct SecondScreenMainView: View {

    @Environment(\.presentationMode) var presetrationMode

    @State var flights: [FlightDTO] = []
    var title = ""
    var currentID = ""

    var body: some View {
        ZStack {
            Color("Black")
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                HStack(spacing: 58) {
                    Button {
                        self.presetrationMode.wrappedValue
                            .dismiss()
                    } label: {
                        HStack{
                            Image(systemName: "chevron.backward")
                                .foregroundColor(Color("White"))
                                .frame(width: 13, height: 22)
                            Text("Назад")
                                .foregroundColor(Color("White"))
                                .font(.custom("LabGrotesqueK-Regular", size: 16))
                        }
                    }
                    Text(title)
                        .foregroundColor(Color("White"))
                        .font(.custom("LabGrotesqueK-Regular", size: 16))
                }.padding(.top, 50)
                if !flights.isEmpty {
                    ScrollView {
                        ForEach(flights) {flight in
                            FlightsView(flightName: flight.name ?? "", flightDate: flight.dateUTC ?? "", isSuccessfully: flight.success ?? false)
                        }
                    }.padding(.top, 50)
                }
            }
        }

        .navigationBarHidden(true)
        .onAppear() {
            NetworkManager().loadFlightsData(id: currentID) { flights in
                self.flights = flights
            }
        }
    }
}

struct SecondScreenMainView_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreenMainView()
    }
}
