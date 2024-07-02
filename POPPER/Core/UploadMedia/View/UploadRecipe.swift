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
    let currentStepIndex : Int
    let postApi = api.uploadPost;
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
                        StepsField()
                        
                    }
                    .padding(.top)
                    .animation(.easeIn)
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
