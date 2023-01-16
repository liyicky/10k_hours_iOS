//
//  ContentView.swift
//  10k_hours_iOS
//
//  Created by Jason Cheladyn on 2022/12/22.
//

import SwiftUI
import ScalingHeaderScrollView
import Introspect


struct CoreView: View {
    
    @EnvironmentObject var store: CoreStore
    @Environment(\.dismiss) var dismiss
    @State var headerProgress: CGFloat = 0
    
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
        .background(.white)
        .environment(\.colorScheme, .light)
    }
}

// MARK: - VIEWS
// Onboarding Views -------------------------------------------------------------------------------------------
extension CoreView {
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
}
// Core Views -------------------------------------------------------------------------------------------------
extension CoreView {
    private var core: some View {
        ZStack(alignment: .bottom) {
            ScalingHeaderScrollView {
                header()
            } content: {
                content
            }
            .collapseProgress($headerProgress)
            
            addPostButton
        }
        .sheet(isPresented: $store.state.postSheetOpen, content: {
            NewPostView()
        })
    }
    
    private func header() -> some View {
        StatsView(progress: $headerProgress)
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

