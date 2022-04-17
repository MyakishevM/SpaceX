//
//  CustomIndicatorBarView.swift
//  SpaceXProject
//
//  Created by Maxim Myakishev on 17.04.2022.
//

import SwiftUI

struct CustomBarIndicatorView: View {
    
    var count: Int
    @Binding var current: Int

    var body: some View {
        ZStack {
            Color("DarkGray")
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 11)
        HStack {
            ForEach(0..<count, id:\.self) { index in
                ZStack {
                    if current == index {
                        Circle()
                            .fill(Color("White"))
                    } else {
                        Circle()
                            .fill(Color("LightGray"))
                            .overlay(
                                Circle()
                                    .stroke(Color("LightGray"), lineWidth: 1.5)
                            )
                    }
                }.frame(width: 8, height: 8)
            }
        }.ignoresSafeArea()
        }
    }
}
