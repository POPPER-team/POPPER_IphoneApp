//
//  UploadFile.swift
//  POPPER
//
//  Created by Lorena Kovačić on 29.05.2024..
//

import SwiftUI

struct UploadFile: View {
    @Binding public var uploadedMedia:UIImage?;
    @State private var IsChoosingPicture = false;
    
    
    var body: some View {
        VStack(alignment: .leading){
            Text("MEDIA")
                .font(.title2)
                .fontWeight(.semibold)
            
            
            VStack{
                PopperButton(buttonText: "Upload video / photo",onClick: {
                    
                    IsChoosingPicture.toggle()
                }, img : Image(systemName: "square.and.arrow.up"))
            }
            .sheet(isPresented: $IsChoosingPicture){
                
                PopperImagePicker(image:self.$uploadedMedia);
            }
            
        }
    }
}
