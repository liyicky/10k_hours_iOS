//
//  StatsViewCell.swift
//  10k_hours_iOS
//
//  Created by Jason Cheladyn on 2023/01/16.
//

import SwiftUI

struct FadingStatsViewCell<Content: View, ShrunkContent: View>: View {
    
    @Binding var progress: CGFloat
    
    @ViewBuilder var content: () -> Content
    @ViewBuilder var shrunk: () -> ShrunkContent
    
    var body: some View {
        ZStack {
            fade_shrunkContent
            fade_content
        }
    }
}

// MARK: - FADEING CELL VIEWS
/// These views (the content view and the shrunk content view) will preform a simple fade transition when scrolled up. It's a very simple animation.
extension FadingStatsViewCell {
    private var fade_content: some View {
        content()
            .modifier(StatsViewCell())
            .opacity(1 - progress)
    }
    
    private var fade_shrunkContent: some View {
        shrunk()
            .modifier(StatsViewCell())
            .frame(maxHeight: StatsView.MinHeight)
            .opacity(progress)
    }
}
