//
//  Comment.swift
//  POPPER
//
//  Created by Matija Lukanić on 02.06.2024..
//

import SwiftUI

struct Comment: Identifiable {
    let id = UUID()
    let text: String
    let author: String //promijeni u userapi koji geta usera
    let date: Date
}

