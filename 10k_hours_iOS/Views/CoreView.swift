//
//  ContentView.swift
//  10k_hours_iOS
//
//  Created by Jason Cheladyn on 2022/12/22.
//

import SwiftUI

struct CoreView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                // Header view
                header
                // Main content
                content
            }
        }
        .ignoresSafeArea()

    }
}

// MARK: - VIEWS
extension CoreView {
    private var header: some View {
        Text("Stats")
            .font(.largeTitle)
            .frame(width: UIScreen.main.bounds.width, height: 300)
            .background(Color.red)
            .shadow(radius: 5, x: 0, y: 5)
    }
    
    private var content: some View {
        Text("Content")
            .font(.title)
            .padding()
    }
}

struct CoreView_Previews: PreviewProvider {
    static var previews: some View {
        CoreView()
    }
}

