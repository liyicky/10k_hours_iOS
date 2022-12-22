//
//  TestView.swift
//  10k_hours_iOS
//
//  Created by Jason Cheladyn on 2022/12/22.
//

import SwiftUI
import CoreGraphics


struct TestView: View {
    var body: some View {

        ScrollView(showsIndicators: false) {
            VStack {
                // Header view
                Text("Stats")
                    .font(.largeTitle)
                    .frame(width: UIScreen.main.bounds.width, height: 300)
                    .background(Color.red)
                    .shadow(radius: 5, x: 0, y: 5)
                    

                // Main content
                Text("Content")
                    .font(.title)
                    .padding()
            }
        }
        .ignoresSafeArea()

    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
