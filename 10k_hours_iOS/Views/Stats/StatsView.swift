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
    
    var body: some View {
        PagingView(pageCount: 3, currentPage: $store.state.currentStatsPage) {
            cellOne
            cellTwo
            cellThree
        }
        .frame(height: Constants.statViewHeight)
        
        Spacer()
        
        HStack {
            ForEach(0..<3) { index in
                Circle()
                    .fill(index == store.state.currentStatsPage ? Color.blue : Color.gray)
                    .frame(width: 10, height: 10)
            }
        }
    }
}
//
//struct StatsView_Previews: PreviewProvider {
//    static var previews: some View {
//        StatsView()
//    }
//}

// MARK: - VIEWS
extension StatsView {
    private var cellOne: some View {
        VStack(alignment: .leading) {
            Text("Stats")
            Text(store.state.currentProject!.dateCreated!.formatted())
            Text("Progress Reports: \(store.state.postAmount)")
            Text("Time Spent: \(store.state.hoursSpent)")
            Text("Dollars Spent: \(store.state.dollarsSpent)")
            Text("Dollars per Hour: \(store.state.dollarsPerHour)")
        }
        .modifier(StatsViewCell(color: Color.green))
    }
    
    private var cellTwo: some View {
        Chart {
            ForEach(store.state.posts) { post in
                BarMark(
                    x: .value("Date", post.simpleDate),
                    y: .value("Hours", post.simpleHours)
                )
                .foregroundStyle(by: .value("Post", post.title))
            }
        }
        .padding()
        .modifier(StatsViewCell(color: Color.white))
    }
    
    private var cellThree: some View {
        Chart {
            ForEach(store.state.posts) { post in
                BarMark(
                    x: .value("Date", post.simpleDate),
                    y: .value("Dollars", post.simpleDollars)
                )
                .foregroundStyle(by: .value("Post", post.title))
            }
        }
        .padding()
        .modifier(StatsViewCell(color: Color.white))
    }
}
