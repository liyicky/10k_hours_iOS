//
//  ContentView.swift
//  10k_hours_iOS
//
//  Created by Jason Cheladyn on 2022/12/22.
//

import SwiftUI

struct CoreView: View {
    
    @EnvironmentObject var store: CoreStore
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            switch store.state.appState {
            case .onboard: onboarding
            case .core: core
            }
            
            Button {
                store.dispatch(.resetApp)
            } label: {
                Text("Reset App")
            }

        }
    }
}

// MARK: - VIEWS
extension CoreView {
    // Onboarding Views -------------------------------------------------------------------------------------------
    private var onboarding: some View {
        VStack {
            switch store.state.onboardingState {
            case .first:
                onboardingFirstStep
            case .second:
                onboardingSecondStep
            case .third:
                onboardingThirdStep
            }
        }
    }
    
    private var onboardingFirstStep: some View {
        VStack {
            Text("Onboarding now...")
            onboardingNextBtn
        }
    }
    
    private var onboardingSecondStep: some View {
        VStack {
            NewProjectsView()
            
            Button {
                store.dispatch(.addProject)
                store.dispatch(.stepOnboarding)
            } label: {
                Text("Create Project")
            }
            .shadow(color: .black.opacity(0.3), radius: 1)
        }
    }
    
    private var onboardingThirdStep: some View {
        VStack {
            Text("third")
            onboardingNextBtn
        }
    }
    
    private var onboardingNextBtn: some View {
        Button {
            store.dispatch(.stepOnboarding)
        } label: {
            Label("Next", systemImage: "photo")
                .padding()
                .border(.black)
        }
    }
    
    // Core Views -------------------------------------------------------------------------------------------------
    private var core: some View {
        ZStack(alignment: .bottom) {
            ScrollView(showsIndicators: false) {
                VStack {
                    // Header view
                    header
                    // Main content
                    content
                }
            }
            
            addPostButton
        }
        .sheet(isPresented: $store.state.postSheetOpen, content: {
            NewPostView()
        })
    }
    private var header: some View {
        Text("Stats")
            .font(.largeTitle)
            .frame(width: UIScreen.main.bounds.width, height: 300)
            .background(Color.red)
            .shadow(radius: 5, x: 0, y: 5)
    }
    
    private var content: some View {
        ForEach(store.state.posts, id: \.self) { post in
            PostView(post: post)
        }
    }
    
    private var addPostButton: some View {
        Button {
            store.state.postSheetOpen.toggle()
        } label: {
            Label("Add Post", systemImage: "photo")
                .padding()
                .border(.black)
        }

    }
}

struct CoreView_Previews: PreviewProvider {
    static var previews: some View {
        CoreView()
    }
}

