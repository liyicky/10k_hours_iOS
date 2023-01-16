//
//  StatsView.swift
//  10k_hours_iOS
//
//  Created by Jason Cheladyn on 2022/12/27.
//

import SwiftUI
import Charts

struct StatsView: View {
    
    @EnvironmentObject var store: CoreStore
    @Binding var progress: CGFloat
    
    static public let MinHeight: CGFloat = 120
    static public let MaxHeight: CGFloat = 300 - MinHeight
    
    
    var body: some View {
        VStack {
            TabView {
                cellOne
                cellTwo
                cellThree
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .frame(height: StatsView.MinHeight + (1 - progress) * StatsView.MaxHeight)
            .offset(y: StatsView.MinHeight * progress)
        }
    }
}

// MARK: - VIEWS
extension StatsView {
    
    private var cellOne: some View {
        FadingStatsViewCell(progress: $progress) {
            VStack(alignment: .leading) {
                Text("Stats")
                Text(store.state.currentProject!.dateCreated!.formatted())
                Text("Progress Reports: \(store.state.postAmount)")
                Text("Time Spent: \(store.state.hoursSpent)")
                Text("Dollars Spent: \(store.state.dollarsSpent)")
                Text("Dollars per Hour: \(store.state.dollarsPerHour)")
            }
        } shrunk: {
            HStack() {
                Text("Stats")
            }
        }
    }
    
    private var cellTwo: some View {

        ScalingStatsViewCell(progress: $progress) {
            Chart {
                ForEach(store.state.posts) { post in
                    BarMark(
                        x: .value("Date", post.simpleDate),
                        y: .value("Hours", post.simpleHours)
                    )
                }
            }
        }
    }
    
    private var cellThree: some View {
        ScalingStatsViewCell(progress: $progress) {
            Chart {
                ForEach(store.state.posts) { post in
                    BarMark(
                        x: .value("Date", post.simpleDate),
                        y: .value("Dollars", post.simpleDollars)
                    )
//                    .foregroundStyle(by: .value("Post", post.title))
                }
            }
        }
    }
}
