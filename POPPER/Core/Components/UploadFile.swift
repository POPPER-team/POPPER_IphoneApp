//
//  UploadFile.swift
//  POPPER
//
//  Created by Lorena Kovačić on 29.05.2024..
//

import SwiftUI

struct UploadFile: View {
    var body: some View {
        VStack(spacing : 16){
            HStack(alignment: .center){
                Spacer()
                Text("VIDEO")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .bold()
                Spacer()
                Text("upload video")
                    .font(.headline)
                Spacer()
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .frame(width: 25, height: 30)
                Spacer()
            }
            HStack(alignment: .center){
                Spacer()
                Text("PHOTO")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .bold()
                Spacer()
                Text("upload photo")
                    .font(.headline)
                Spacer()
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .frame(width: 25, height: 30)
                Spacer()
            }
        }
    }
}

#Preview {
    UploadFile()
}
