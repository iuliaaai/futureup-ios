//
//  CoinDescriptionView.swift
//  future-up-ios
//
//  Created by Iulia Ionascu on 05.04.2022.
//

import SwiftUI

@available(iOS 15.0, *)
struct CoinDescriptionView: View{
    var title: String
    var text: String
    @Binding var showDescription: Bool
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(spacing: 5){
            HStack(){
                Text(title)
                    .fontWeight(.semibold)
                    .background(Color.white)
                    .padding(10)
                Spacer()
                Button(
                    action: {
                        showDescription.toggle()
                    },
                    label: {
                        Text("X")
                            .frame(width: 30, height: 30)
                            .background(Color.init(red:0.855, green: 0.447, blue: 0.771))
                            .cornerRadius(50)
                            .foregroundColor(.black)
                    })
                    .padding(10)
                
            }
            ScrollView {
                Text(text)
                    .foregroundColor(Color.black)
                    .background(Color.white)
                    .padding(10)
            }
        }
        .frame(width: 300, height: 400, alignment: .center)
        .foregroundColor(Color.black)
        .background(Color.white)
        .cornerRadius(30)
        
        
    }
}
