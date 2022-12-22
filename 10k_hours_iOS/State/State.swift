//
//  State.swift
//  10k_hours_iOS
//
//  Created by Jason Cheladyn on 2022/12/22.
//

import Foundation

struct CoreState {
    // Core Objects for App State
    var projects = [ProjectEntity]()
    var posts = [PostEntity]()
    
    // Post Creation
    var postSheetOpen = false
    var newPost = Post.defaultPost
}
