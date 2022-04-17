//
//  VericalView.swift
//  SpaceXProject
//
//  Created by Maxim Myakishev on 11.04.2022.
//

import SwiftUI

struct InfoParametersView: View {

    var value = ""
    var characteristic = ""
    var isTextBold = false
    var isDate = false
    var isWithSecMetrics: Bool?
    fileprivate let tonMetrics = "ton"
    fileprivate let secMetrics = "sec"
    
    var body: some View {
        HStack {
            Text(characteristic)
                .font(.custom("LabGrotesque-Regular", size: 16))
                .foregroundColor(Color("FirstScreenLabelsColor"))
            Spacer()
            HStack(spacing: 8) {
                Text(isDate ? formatStringDate(value) : value)
                    .font(.custom(isTextBold ? "LabGrotesqueK-Bold" : "LabGrotesqueK-Regular", size: 16))
                    .foregroundColor(Color("ValueLabelColor"))
                Text(self.checkingMetrics())
                    .font(.custom(isTextBold ? "LabGrotesqueK-Bold" : "LabGrotesqueK-Regular", size: 16))
                    .foregroundColor(Color("LightGray"))
            }
        }
    }

    //MARK: -Methods

    //MARK: -change date format
    func formatStringDate(_ date: String) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
        if let newDate = dateFormatter.date(from: date) {
            dateFormatter.setLocalizedDateFormatFromTemplate("MMMM d, yyyy")
            return dateFormatter.string(from: newDate)
        }
        return ""
    }

    //MARK: - check metrics
    func checkingMetrics() -> String {
        switch isWithSecMetrics {
        case true:
            return secMetrics
        case false:
            return tonMetrics
        default:
            return ""
        }

    }
}

struct VericalView_Previews: PreviewProvider {
    static var previews: some View {
        InfoParametersView()
    }
}
