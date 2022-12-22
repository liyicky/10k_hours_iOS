//
//  NewPostView.swift
//  10k_hours_iOS
//
//  Created by Jason Cheladyn on 2022/12/22.
//

import SwiftUI
import PhotosUI

struct NewPostView: View {
    
    @EnvironmentObject var store: CoreStore
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        form
    }
}

extension NewPostView {
    private var form: some View {
        Form {
            Section {
                TextField("...", text: $store.state.newPost.title)
            } header: {
                Text("Post Title")
            }
            
            Section {
                TextField("$", text: $store.state.newPost.dollarsInvested)
                    .keyboardType(.decimalPad)
            } header: {
                Text("Dollars Invested")
            }
            
            Section {
                TextField("0.0", text: $store.state.newPost.hoursInvested)
                    .keyboardType(.decimalPad)
            } header: {
                Text("Hours Invested")
            }
            
            Section {
                PhotosPicker(
                    selection: $store.state.newPost.image,
                    matching: .any(of: [.images, .not(.livePhotos)]),
                    photoLibrary: .shared()
                ) {
                    Label("Select a photo", systemImage: "photo")
                }
                
                if let data = store.state.newPost.binaryImageData,
                   let uiImage = UIImage(data: data) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .clipped()
                }
                
            }
            
            Section {
                TextEditor(text: $store.state.newPost.content)
                    .keyboardType(.twitter)
            } header: {
                Text("Content")
            } footer: {
                Text("Write about what you did, how you did it, etc")
                    .font(.system(size: 10))
            }
            
            Button {
                store.dispatch(.addPost)
                dismiss()
            } label: {
                Text("Create Post")
            }
            .shadow(color: .black.opacity(0.3), radius: 1)
        }
        .onChange(of: store.state.newPost.image) { newItem in
            Task {
                // Retrive selected asset in the form of Data
                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                    store.state.newPost.binaryImageData = data
                }
            }
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
