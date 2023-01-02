//
//  PagingView.swift
//  10k_hours_iOS
//
//  Created by Jason Cheladyn on 2022/12/27.
//

import SwiftUI

struct PagingView<Content: View>: View {
    let pageCount: Int
    @Binding var currentPage: Int
    let content: Content

    @GestureState private var translation: CGFloat = 0

    init(pageCount: Int, currentPage: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.pageCount = pageCount
        self._currentPage = currentPage
        self.content = content()
    }

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                self.content
                    .frame(width: geometry.size.width)
                    .offset(x: -CGFloat(self.currentPage) * geometry.size.width)
                    .gesture(
                        DragGesture().updating(self.$translation) { value, state, _ in
                            state = value.translation.width
                        }.onEnded { value in
                            let offset = value.translation.width / geometry.size.width
                            let newPage = (CGFloat(self.currentPage) - offset).rounded()
                            withAnimation(.interactiveSpring(), {
                                self.currentPage = min(max(0, Int(newPage)), self.pageCount - 1)
                            })
                        }
                    )
            }
        }
    }
}
