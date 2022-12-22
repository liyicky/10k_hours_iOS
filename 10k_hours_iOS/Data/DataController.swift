//
//  DataController.swift
//  10k_hours_iOS
//
//  Created by Jason Cheladyn on 2022/12/22.
//

import CoreData

class DataController {
    static let instance = DataController()
    
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "DataModels")
        context = container.viewContext
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    func save(completion: @escaping (Error?) -> () = {_ in}) {
        if context.hasChanges {
            do {
                try context.save()
                print("Core Data saved!")
            } catch {
                print("Core Data couldn't save! \(error.localizedDescription)")
                completion(error)
            }
        }
    }
    
    func fetchProjects() -> [ProjectEntity] {
        let fetchRequest = NSFetchRequest<ProjectEntity>(entityName: "ProjectEntity")
        var entites: [ProjectEntity] = []
        do {
            entites = try context.fetch(fetchRequest)
        } catch {
            print("Core Data couldn't fetch projects! \(error.localizedDescription)")
        }
        
        return entites
    }
    
    func fetchPosts() -> [PostEntity] {
        let fetchRequest = NSFetchRequest<PostEntity>(entityName: "PostEntity")
        var entites: [PostEntity] = []
        do {
            entites = try context.fetch(fetchRequest)
        } catch {
            print("Core Data couldn't fetch projects! \(error.localizedDescription)")
        }
        
        return entites
    }
    
    
}

