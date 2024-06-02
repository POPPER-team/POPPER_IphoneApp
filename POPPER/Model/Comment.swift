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
    let author: String
    let date: Date
}

