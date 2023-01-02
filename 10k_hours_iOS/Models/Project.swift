//
//  Project.swift
//  10k_hours_iOS
//
//  Created by Jason Cheladyn on 2022/12/27.
//

import Foundation

struct Project {
    var id: UUID
    var name: String
    var dataCreated: Date
    
    static let defaultProject = Project(id: UUID(), name: "", dataCreated: Date.now)
    
    static func fetchAll() -> [Project] {
        var results = [Project]()
        let allProjectEntities = DataController.instance.fetchProjects()
        for entity in allProjectEntities {
            let newResult = Project(id: entity.id!, name: entity.name!, dataCreated: entity.dateCreated!)
            results.append(newResult)
        }
        return results
    }
}
