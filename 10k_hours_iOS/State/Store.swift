//
//  Store.swift
//  10k_hours_iOS
//
//  Created by Jason Cheladyn on 2022/12/22.
//

import Foundation

typealias CoreStore = Store<CoreState, CoreAction>
class Store<State, Action>: ObservableObject {
    @Published var state: State
    private let reducer: Reducer<State, Action>
    private let queue = DispatchQueue(label: "com.liyicky.10kHours.store", qos: .userInitiated)
    private let data = DataController.instance
    
    init(initial: State, reducer: @escaping Reducer<State, Action>) {
        self.state = initial
        self.reducer = reducer
    }
    
    func dispatch(_ action: Action) {
        queue.sync {
            self.dispatch(self.state, action)
        }
    }
    
    private func dispatch(_ currentState: State, _ action: Action) {
        state = reducer(currentState, action)
    }
}
