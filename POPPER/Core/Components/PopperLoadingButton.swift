//
//  ContentView.swift
//  LoadingViewExample
//
//  Created by Juraj Macák on 03/12/2021.
//

import SwiftUI
import LoadingButton

struct PopperLoadingButton: View {
    
    @State private var isLoading: Bool = false
    @FocusState private var isFocus: Bool
    let buttonText: String
    let onClick: () -> Void

    private var style: LoadingButtonStyle {
        return .init(width: 350, height: 50, cornerRadius: 20, backgroundColor: Color.gray.opacity(0.25), loadingColor: Color.gray.opacity(0.55), strokeWidth: 1, strokeColor: .black)
       }
    
    init(buttonText: String, onClick: @escaping () -> Void) {
        self.buttonText = buttonText
        self.onClick = onClick
    }

    var body: some View {
        VStack {            
            LoadingButton(action: {
                isFocus = false
                self.isLoading = true
                //TODO: Test with real Authenticate function, not sure if it can return data.
                DispatchQueue.global().async {
                    onClick()
                    DispatchQueue.main.async{
                        self.isLoading = false
                    }
                }
                
            }, isLoading: $isLoading, style: style) {
                Text(buttonText)
            }
            .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
            .cornerRadius(20)
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.black)
            .disabled(isLoading)
        }
    }
}

#Preview {
    PopperLoadingButton(buttonText: "Login", onClick: {
        for i in 0...3{
            sleep(1);
            print(i)
        }
    })
}
