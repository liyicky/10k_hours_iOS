//
//  Reducers.swift
//  10k_hours_iOS
//
//  Created by Jason Cheladyn on 2022/12/22.
//

import Foundation

typealias Reducer<State, Action> = (State, Action) -> State
let coreReducer: Reducer<CoreState, CoreAction> = { state, action in
    var mutatingState = state
    
    switch action {
        
    case .startApp:
        print("10k hours: App Started")
        mutatingState.projects = DataController.instance.fetchProjects()
        mutatingState.currentProject = mutatingState.projects.first
        mutatingState.posts = DataController.instance.fetchPosts()
        print("10k hours: Data fetched")
        if mutatingState.currentProject != nil {
            mutatingState.appState = .core
            print("10k hours: Core State loaded")
        } else {
            mutatingState.appState = .onboard
            print("10k hours: Onboard State loaded")
        }
        
    case .stepOnboarding:
        switch mutatingState.onboardingState {
        case .first:
            mutatingState.onboardingState = .second
            break
        case .second:
            mutatingState.onboardingState = .third
            break
        case .third:
            mutatingState.appState = .core
            break
        }
        
    case .resetApp:
        mutatingState.appState = .onboard
        mutatingState.onboardingState = .first
        
    case .addProject:
        let newProject = ProjectEntity(context: DataController.instance.context)
        newProject.name = mutatingState.newProject.name
        
        DataController.instance.save {_ in
            if mutatingState.appState == .onboard {
                mutatingState.onboardingState = .third
                mutatingState.projects = DataController.instance.fetchProjects()
                mutatingState.currentProject = newProject
                mutatingState.newProject = .defaultProject
            }
        }
        
    case .addPost:
        let newPost = PostEntity(context: DataController.instance.context)
        newPost.project = mutatingState.currentProject
        newPost.title = mutatingState.newPost.title
        
        // TODO: Remove the force unwraps
        newPost.dollars = Int64(mutatingState.newPost.dollarsInvested)!
        newPost.hours = Int16(mutatingState.newPost.hoursInvested)!
        
        newPost.date = Date.now
        newPost.content = mutatingState.newPost.content
        newPost.image = mutatingState.newPost.binaryImageData
        DataController.instance.save()
        mutatingState.posts = DataController.instance.fetchPosts()
        mutatingState.newPost = .defaultPost
        
    case .fetchPosts:
        mutatingState.posts = DataController.instance.fetchPosts()
    }
    
    return mutatingState
}
