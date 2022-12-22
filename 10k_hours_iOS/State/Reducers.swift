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
    }
    
    return mutatingState
}
