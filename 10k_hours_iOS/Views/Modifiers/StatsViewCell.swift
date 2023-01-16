//
//  StatsViewCell.swift
//  10k_hours_iOS
//
//  Created by Jason Cheladyn on 2022/12/27.
//

import SwiftUI

struct StatsViewCell: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(Color.white)
            .background(Color.gray)
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.7), radius: 5)
            .padding()
    }
}
