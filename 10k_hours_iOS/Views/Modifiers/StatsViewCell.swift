//
//  StatsViewCell.swift
//  10k_hours_iOS
//
//  Created by Jason Cheladyn on 2022/12/27.
//

import SwiftUI

struct StatsViewCell: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .frame(height: Constants.statViewHeight)
            .background(color)
        
    }
}
