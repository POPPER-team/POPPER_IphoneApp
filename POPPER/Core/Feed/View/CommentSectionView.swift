//
//  CommentSectionView.swift
//  POPPER
//
//  Created by Matija Lukanić on 02.06.2024..
//

import Foundation
import SwiftUI

struct CommentSectionView: View {
    @State private var comments: [Comment] = [
        Comment(text: "Great post!", author: "Test1", date: Date()),
        Comment(text: "I totally agree!", author: "Test2", date: Date())
    ]
    @State private var newCommentText: String = ""
    @State private var author: String = "Anonymous" // Switchaj na usera kasnije
    
    var body: some View {
        VStack {
            List(comments) { comment in
                VStack(alignment: .leading) {
                    Text(comment.text)
                        .font(.body)
                    Text("By \(comment.author) on \(comment.date, formatter: commentDateFormatter)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            
            HStack {
                TextField("Enter your comment", text: $newCommentText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    addComment()
                }) {
                    Text("Post")
                        .bold()
                }
                .padding()
                .disabled(newCommentText.isEmpty)
            }
            .padding()
        }
        .padding()
    }
    
    private func addComment() {
        let newComment = Comment(text: newCommentText, author: author, date: Date())
        comments.append(newComment)
        newCommentText = ""
    }
    
    private var commentDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
}

