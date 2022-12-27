//
//  _0k_hours_iOSApp.swift
//  10k_hours_iOS
//
//  Created by Jason Cheladyn on 2022/12/22.
//

import SwiftUI

@main
struct AppMain: App {
    
    let store = CoreStore(initial: CoreState(), reducer: coreReducer)
    
    var body: some Scene {
        WindowGroup {
            CoreView()
                .environmentObject(store)
                .onAppear{
                    store.dispatch(.startApp)
                }
        }
    }
}
