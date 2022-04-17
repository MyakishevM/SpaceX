//
//  RocketIconView.swift
//  SpaceXProject
//
//  Created by Maxim Myakishev on 14.04.2022.
//

import SwiftUI

struct RocketIconView: View {

    var isSuccesfully = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image("Rocket")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            if isSuccesfully {
                Image(systemName: "checkmark")
                .foregroundColor(.white)
                .background(
                    Circle()
                        .fill(Color("Green"))
                )
                .frame(width: 12, height: 12)
            } else {
                Image(systemName: "x.circle.fill")
                .frame(width: 12, height: 12)
                .foregroundColor(Color("Red"))
                .frame(width: 12, height: 12)
            }
        }
    }
}

struct RocketIconView_Previews: PreviewProvider {
    static var previews: some View {
        RocketIconView()
    }
}
