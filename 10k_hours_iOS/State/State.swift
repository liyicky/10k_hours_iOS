//
//  State.swift
//  10k_hours_iOS
//
//  Created by Jason Cheladyn on 2022/12/22.
//

import Foundation

struct CoreState {
    // AppState
    var appState: AppState = .onboard
    var onboardingState: OnboardingState = .first
    
    // Core Objects for App State
    var currentProject: ProjectEntity? = nil
    var projects = [ProjectEntity]()
    var posts = [PostEntity]()
    
    // Project Creation
    var newProject = Project.defaultProject
    
    // Post Creation
    var postSheetOpen = false
    var newPost = Post.defaultPost
    
}

enum AppState {
    case onboard, core
}

enum OnboardingState {
    case first, second, third
}
