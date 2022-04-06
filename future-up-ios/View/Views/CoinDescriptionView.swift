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
    @State private var showDescription = false
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(spacing: 5){
            HStack(spacing: UIViewConstants.padding){
                Text(title)
                    .fontWeight(.semibold)
                    .background(Color.white)

                Button(
                    action: {
                        presentationMode.wrappedValue.dismiss()
                    },
                    label: {
                        Text("X")
                            .frame(width: 30, height: 30)
                            .background(Color.init(red:0.855, green: 0.447, blue: 0.771))
                            .cornerRadius(50)
                            .foregroundColor(.black)
                    })
            }
            Text(text)
                .foregroundColor(Color.black)
                .background(Color.white)
        }
        .frame(width: 300, height: 400, alignment: .center)
        .foregroundColor(Color.black)
        .background(Color.white)
        .cornerRadius(30)
        
        
    }
}
