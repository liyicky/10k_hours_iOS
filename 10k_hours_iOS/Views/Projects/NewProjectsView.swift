//
//  NewProjectsView.swift
//  10k_hours_iOS
//
//  Created by Jason Cheladyn on 2022/12/27.
//

import SwiftUI

struct NewProjectsView: View {
    
    @EnvironmentObject var store: CoreStore
    
    var body: some View {
        form
    }
}

// MARK: - PRIVIEW
struct NewProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        NewProjectsView()
    }
}

// MARK: - VIEWS
extension NewProjectsView {
    private var form: some View {
        Form {
            Section {
                TextField("...", text: $store.state.newProject.name)
            } header: {
                Text("Project Name")
            }
        }
    }
}
