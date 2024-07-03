//
//  UploadRecipe.swift
//  POPPER
//
//  Created by Lorena Kovačić on 29.05.2024..
//

import SwiftUI

struct UploadRecipe: View {
    @State private var Title: String = ""
    @State private var Description: String = ""
    @State private var Ingredients: String = ""
    @State private var Steps: String = ""
    @State private var media: UIImage?
    @StateObject var postApi = UploadApi()
    
    
    let currentStepIndex : Int
    var body: some View {
        ScrollView{
            VStack {
                Spacer() }
            
                VStack (spacing:10){
                    VStack(alignment: .leading)
                    {
                        HStack() {
                            
                            Text("TITLE")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .frame(alignment: .leading)
                            Spacer()
                        }
                        PopperInputField(placeholder: "Enter title", text: $Title)
                        
                        HStack() {
                            
                            Text("DESCRIPTION")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .frame(alignment: .leading)
                            Spacer()
                        }
                        PopperInputField(placeholder: "#tag #tag", text: $Description)
                        
                        IngredientsField(recipePart : $Ingredients)
                        StepsField(recipePart: $Steps)
                        
                    }
                    .padding(.top)
                    .animation(.easeIn)
                    VStack(){
                        UploadFile(uploadedMedia: $media)
                        PopperButton(buttonText: "PREVIEW AND UPLOAD", onClick: {
                            
                            let data:NewPostDto = NewPostDto(
                                Title : Title, Description : Description,
                                Ingridients : Ingredients.components(separatedBy: "\n"),
                                Steps : Steps.components(separatedBy: "\n")
                            )
                            
                            print(data);
                            

                                    postApi.CreateNewPost(newPost: data)
                                    {
                                        post in
                                        postApi.UploadMedia(imageData: DataField(name:"File", data: (media?.scalePreservingAspectRatio(targetSize: CGSize(width: 100, height: 100)))!.jpegData(compressionQuality: 0.1)!, mimeType: "img/jpg"),guid: post!.guid )
                                    }
                                

                        })
                    }
                    .animation(.easeIn)

            }
            .padding(20)
            .scrollTargetLayout()
            
        }
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
    }
}
    
#Preview {
    UploadRecipe(currentStepIndex: 2)
}
