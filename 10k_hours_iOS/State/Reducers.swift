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
        mutatingState.projects = Project.fetchAll()
        // TODO: Fetch the current project in a smart way
        mutatingState.currentProject = DataController.instance.fetchProjects().first
        mutatingState.posts = Post.fetchAll()
        print("10k hours: Data fetched")
        if mutatingState.currentProject != nil {
            mutatingState.appState = .core
            print("10k hours: Core State loaded w/ project: \(mutatingState.currentProject!.name!)")
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
        newProject.id = mutatingState.newProject.id
        newProject.name = mutatingState.newProject.name
        newProject.dateCreated = mutatingState.newProject.dataCreated
        
        DataController.instance.save {_ in
            if mutatingState.appState == .onboard {
                mutatingState.projects = Project.fetchAll()
                //TODO: Fetch this current project in a smart way
                mutatingState.currentProject = DataController.instance.fetchProjects().last
                mutatingState.newProject = .defaultProject
                mutatingState.onboardingState = .third
            }
        }
        
    case .addPost:
        let newPost = PostEntity(context: DataController.instance.context)
        newPost.project = mutatingState.currentProject
        newPost.id = mutatingState.newPost.id
        newPost.title = mutatingState.newPost.title
        
        // TODO: Remove the force unwraps
        newPost.dollars = Int64(mutatingState.newPost.dollarsInvested)!
        newPost.hours = Int16(mutatingState.newPost.hoursInvested)!
        
        newPost.date = Date.now
        newPost.content = mutatingState.newPost.content
        newPost.image = mutatingState.newPost.binaryImageData
        DataController.instance.save()
        mutatingState.posts = Post.fetchAll()
        mutatingState.newPost = .defaultPost
        
    case .fetchPosts:
        mutatingState.posts = Post.fetchAll()
    }
    
    return mutatingState
}
