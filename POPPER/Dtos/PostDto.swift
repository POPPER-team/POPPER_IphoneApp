//
//  PostDto.swift
//  POPPER
//
//  Created by Lorena Kovačić on 06.06.2024..
//

import Foundation
struct PostDto: Codable {
    let guid: String
    let title: String
    let description: String?
    let mediaGuid: String?
    let duration: String?
    let userGuid: String
    let likes: Int
    let savedCount: Int
    let viewCount: Int
    let comments: [CommentDto]
    let ingredients: [IngridientDto]
    let steps: [StepDto]
}

struct CommentDto: Codable {
    let guid: String
    let userGuid: String
    let text: String
    let timestamp: String
}

struct IngridientDto: Codable {
    let guid: String
    let name: String
    let amount: String
}

struct StepDto: Codable {
    let guid: String
    let text: String
    let imageGuid: String
}
