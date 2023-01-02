//
//  Post.swift
//  10k_hours_iOS
//
//  Created by Jason Cheladyn on 2022/12/22.
//

import SwiftUI
import PhotosUI
import Charts

struct Post {
    var id: UUID
    var title: String
    var dollarsInvested: String
    var hoursInvested: String
    var content: String
    var image: PhotosPickerItem?
    var binaryImageData: Data?
    var date: Date
    
    var simpleDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm MM/dd/yy"
        return formatter.string(from: self.date)
    }
    
    var simpleHours: Int {
        Int(hoursInvested) ?? 0
    }
    
    var simpleDollars: Int {
        Int(dollarsInvested) ?? 0
    }
    
    var color: String {
        let colors = ["Green", "Blue", "Red", "Yellow"]
        return colors.randomElement() ?? "Red"
    }
    
    static let defaultPost = Post(id: UUID(), title: "", dollarsInvested: "", hoursInvested: "", content: "", image: nil, binaryImageData: nil, date: Date.now)
    
    static func fetchAll() -> [Post] {
        var results = [Post]()
        let allPostEntities = DataController.instance.fetchPosts()
        for entity in allPostEntities {
            let newResult = Post(id: entity.id!, title: entity.title!, dollarsInvested: String(entity.dollars), hoursInvested: String(entity.hours), content: entity.content!, image: nil, binaryImageData: entity.image!, date: entity.date!)
            results.append(newResult)
        }
        return results
    }
}

extension Post: Hashable {
    
}

extension Post: Identifiable {
    
}
