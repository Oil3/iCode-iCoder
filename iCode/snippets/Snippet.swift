//
//  Snippet.swift
//  iCode
//
//  Created by ZZS on 17/02/2024.
//

import Foundation

struct Snippet: Identifiable, Codable {
    let id: UUID
    let content: String
    let timestamp: Date
    let isUser: Bool // In your case, this will always be true since it's "chat to oneself"
    
    init(id: UUID = UUID(), content: String, timestamp: Date = Date(), isUser: Bool = true) {
        self.id = id
        self.content = content
        self.timestamp = timestamp
        self.isUser = isUser
    }
}       
