//
//  Post.swift
//  10k_hours_iOS
//
//  Created by Jason Cheladyn on 2022/12/22.
//

import SwiftUI
import PhotosUI

struct Post {
    var title: String
    var dollarsInvested: String
    var hoursInvested: String
    var content: String
    var image: PhotosPickerItem?
    var binaryImageData: Data?
    
    static let defaultPost = Post(title: "", dollarsInvested: "", hoursInvested: "", content: "", image: nil, binaryImageData: nil)
}
