//
//  CustomPageControl.swift
//  SpaceXProject
//
//  Created by Maxim Myakishev on 17.04.2022.
//

import SwiftUI

struct PageControlView: View {
    @State var numberOfPages = 0
    @State var pageNumber = 0
    var body: some View {
        ZStack {
        Rectangle()
            .fill(Color("DarkGrey"))
            .ignoresSafeArea()
            CustomPageControl(current: pageNumber, numberOfPages: numberOfPages)
        }  .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 11)
            .padding(.top,  UIScreen.main.bounds.height / 2 )
    }
}


struct CustomPageControl: UIViewRepresentable {

@ObservedObject var model = GettingData()
    
var current = 0
var numberOfPages = 0
    func makeUIView(context: UIViewRepresentableContext<CustomPageControl>) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor(named: "White")
        pageControl.numberOfPages = numberOfPages
        pageControl.pageIndicatorTintColor = UIColor(named: "LightGrey")
        return pageControl
    }

    func updateUIView(_ uiView: UIPageControl, context: UIViewRepresentableContext<CustomPageControl>) {
        uiView.currentPage = model.index
    }

}

class GettingData: ObservableObject {
    @Published var index = 0
}
