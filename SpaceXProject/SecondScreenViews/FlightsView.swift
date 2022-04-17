//
//  FlightsView.swift
//  SpaceXProject
//
//  Created by Maxim Myakishev on 13.04.2022.
//

import SwiftUI

struct FlightsView: View {
    
    var flightName: String = "Name"
    var flightDate: String = "date"
    var isSuccessfully: Bool = false

    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color("DarkGray"))
                HStack {
                    VStack(alignment: .leading) {
                        Text(flightName)
                            .font(.custom("LabGrotesqueK-Regular", size: 20))
                            .foregroundColor(Color("FirstScreenLabelsColor"))
                        Text(formatStringDate(flightDate))
                            .font(.custom("LabGrotesqueK-Regular", size: 16))
                            .foregroundColor(Color("FirstScreenLabelsColor"))
                    }.padding(24)
                    Spacer()
                    RocketIconView(isSuccesfully: isSuccessfully)
                        .padding(.trailing, 35)
                }
            }.frame(width: 311, height: 100)
        }
    }

    func formatStringDate(_ date: String) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let newDate = dateFormatter.date(from: date) {
            dateFormatter.setLocalizedDateFormatFromTemplate("MMMM d, yyyy")
            return dateFormatter.string(from: newDate)
        }
        return ""
    }
}

struct FlightsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FlightsView()
                .previewInterfaceOrientation(.portrait)
            FlightsView()
                .previewInterfaceOrientation(.portrait)
        }
    }
}
