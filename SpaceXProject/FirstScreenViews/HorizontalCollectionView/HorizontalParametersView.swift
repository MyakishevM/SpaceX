//
//  HeightView.swift
//  SpaceXProject
//
//  Created by Maxim Myakishev on 08.04.2022.
//

import SwiftUI

struct HorizontalParametersView: View {

    //MARK: -Properties
    var value: String = ""
    var inscription: String = ""
    var isSeparated = false

    var body: some View {

        ZStack {
            RoundedRectangle(cornerRadius: 32)
                .fill(Color("DarkGray"))
                .frame(width: 96, height: 96)
            VStack(alignment: .center) {
                Text(isSeparated ? formatValue(value) : value )
                    .font(.custom("LabGrotesqueK-Bold", size: 16))
                    .foregroundColor(Color("White"))
                Text(inscription)
                    .font(.custom("LabGrotesqueK-Regular", size: 16))
                
                    .foregroundColor(Color("LightGray"))
            }
        }
    }
//MARK: Method to separate numbers with ","
    func formatValue(_ value: String ) -> String {

        if let double = Double(value) {

            let formatter = Number.withSeparator
            if let result = formatter.string(from: NSNumber(value: double)) {
                return result
            } else {
                return value
            }
        } else {
            return value
        }
    }
}

struct HeightView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalParametersView()
    }
}

