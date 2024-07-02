//
//  MediaPicker.swift
//  POPPER
//
//  Created by Lorena Kovačić on 02.07.2024..
//

import SwiftUI
import PhotosUI


struct MediaPicker: View {
    @State var selectedItems: [PhotosPickerItem] = []
    
    
    var body: some View {
        PhotosPicker(selection: $selectedItems,matching: .any(of: [.images, .videos])) {
            Text("Select media to upload")
        }
    }
    

    
}

#Preview {
    ZStack {
        MediaPicker()
    }
}
