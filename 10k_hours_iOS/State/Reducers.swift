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
        print("App Started")
    case .addPost:
        let newPost = PostEntity(context: DataController.instance.context)
//        newPost.project = mutatingState.projects.first
        newPost.title = mutatingState.newPost.title
        
        // TODO: Remove the force unwraps
        newPost.dollars = Int64(mutatingState.newPost.dollarsInvested)!
        newPost.hours = Int16(mutatingState.newPost.hoursInvested)!
        
        newPost.date = Date.now
        newPost.content = mutatingState.newPost.content
        newPost.image = mutatingState.newPost.binaryImageData
        DataController.instance.save()
        mutatingState.posts = DataController.instance.fetchPosts()
        mutatingState.newPost = Post.defaultPost
    }
    
    return mutatingState
}
