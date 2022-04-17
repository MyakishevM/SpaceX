//
//  RocketNameAndSettingsButtonView.swift
//  SpaceXProject
//
//  Created by Maxim Myakishev on 13.04.2022.
//

import SwiftUI

struct RocketNameAndSettingsButtonView: View {

    var rocketName: String?

    var body: some View {
        HStack {
            Text(rocketName ?? "")
                .fontWeight(.regular)
                .font(.custom("LabGrotesqueK-Regular", size: 24))
                .foregroundColor(.white)
            Spacer(minLength: 135.67)
            Button {
                //
            } label: {
                Image(systemName: "gearshape")
                    .renderingMode(.original)
                    .resizable()
                    .foregroundColor(Color(#colorLiteral(red: 0.8308513761,
                                                         green: 0.8308513761,
                                                         blue: 0.8308513761,
                                                         alpha: 1)))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25.71, height: 27.63)
            }
        }
    }
}

struct RocketNameAndSettingsButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RocketNameAndSettingsButtonView()
    }
}
