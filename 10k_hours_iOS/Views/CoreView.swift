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
}

// MARK: - VIEWS
extension CoreView {
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

