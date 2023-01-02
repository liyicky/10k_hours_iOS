//
//  State.swift
//  10k_hours_iOS
//
//  Created by Jason Cheladyn on 2022/12/22.
//

import SwiftUI

struct CoreState {
    // AppState
    var appState: AppState = .onboard
    var onboardingState: OnboardingState = .first
    
    // Core Objects for App State
    var currentProject: ProjectEntity? = nil
    var projects = [Project]()
    var posts = [Post]()
    
    // Stats
    var currentStatsPage = 0
    
    // Project Creation
    var newProject = Project.defaultProject
    
    // Post Creation
    var postSheetOpen = false
    var newPost = Post.defaultPost
    
    // Data Aggregate Functions
    var postAmount: Int {
        return posts.count
    }
    
    var hoursSpent: String {
        var allHours = 0
        for post in posts {
            allHours += Int(post.hoursInvested) ?? 0
        }
        let percentageOfTenthousand = Float(allHours) / Float(10000.0) * 100
        
        return "\(allHours) hours (\(percentageOfTenthousand)% to 10k)"
    }
    
    var dollarsSpent: String {
        var allDollars = 0.0
        for post in posts {
            allDollars += Double(post.dollarsInvested) ?? 0.0
        }
        
        return "\(formatCurrency(allDollars))"
    }
    
    var dollarsPerHour: String {
        let dperh = (Double(dollarsSpent) ?? 1) / (Double(hoursSpent) ?? 1)
        return "\(formatCurrency(dperh))"
    }
    
}

enum AppState {
    case onboard, core
}

enum OnboardingState {
    case first, second, third
}
