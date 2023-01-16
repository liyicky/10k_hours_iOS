//
//  ScalingStatsViewCell.swift
//  10k_hours_iOS
//
//  Created by Jason Cheladyn on 2023/01/16.
//

import SwiftUI

struct ScalingStatsViewCell<Content: View>: View {
    
    @Binding var progress: CGFloat
    
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        scaling_content
    }
}

// MARK: - SCALING CELL VIEWS
/// This will perform a height scaling effect on one view.
extension ScalingStatsViewCell {
    private var scaling_content: some View {
        VStack {
            content().padding()
        }
        .modifier(StatsViewCell())
    }
}
