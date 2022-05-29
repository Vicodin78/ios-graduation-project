//
//  PostModel.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 03.05.2022.
//

import UIKit

struct PostModel {
    let author: String
    let description: String
    let image: String
    var likes: Int
    var views: Int
    
    static func makePost() -> [PostModel] {
        let textPost = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        var post = [PostModel]()
        post.append(PostModel(author: "Ivan", description: textPost, image: "img1", likes: 0, views: 0))
        post.append(PostModel(author: "Nikolay", description: textPost, image: "img2", likes: 0, views: 0))
        post.append(PostModel(author: "Evgeniy", description: textPost, image: "img3", likes: 0, views: 0))
        post.append(PostModel(author: "Anastasia", description: textPost, image: "img4", likes: 0, views: 0))
        post.append(PostModel(author: "Olga", description: textPost, image: "img5", likes: 0, views: 0))
        return post
    }
}
