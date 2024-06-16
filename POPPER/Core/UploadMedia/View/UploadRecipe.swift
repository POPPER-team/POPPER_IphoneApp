//
//  UploadRecipe.swift
//  POPPER
//
//  Created by Lorena Kovačić on 29.05.2024..
//

import SwiftUI

struct UploadRecipe: View {
    @State private var recipePart: String = ""
    let currentStepIndex : Int
    let postApi = api.uploadPost;
    var body: some View {
        ScrollView{
            Spacer()
                VStack (spacing:10){
                    VStack(alignment: .leading)
                    {
                        HStack() {
                            
                            Text("TITLE")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .frame(alignment: .leading)
                            Spacer()
                            PopperCloseButton(onClick: {})
                                .frame(alignment: .bottom)
                            
                        }
                        
                        PopperInputField(placeholder: "Enter title", text: $recipePart)
                        Text("INGREDIENTS")
                            .font(.title2)
                            .fontWeight(.semibold)
                        PopperInputField(placeholder: "Enter ingredients", text: $recipePart)
                        StepsFieldFocused()
                    } .padding(.top)
                    VStack(){
                        UploadFile()
                        PopperButton(buttonText: "PREVIEW AND UPLOAD", onClick: {
                            api.uploadPost.GetPost(guid: "123"){_ in 
                                print ("Bokic")
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
