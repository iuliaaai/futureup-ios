//
//  CoinSelectionView.swift
//  future-up-ios
//
//  Created by Iulia Ionascu on 06.04.2022.
//

import SwiftUI

struct CoinSelectionView: View{
    
    @State var text: String = ""
    @State private var showCoinSelection = false
    
    var body: some View{
        VStack(alignment: .leading){
            Text("Select coin")
            
            Text("How much?")
            
            TextField("Value", text: $text)
                .textFieldStyle(.roundedBorder)
    
            
            HStack{
                Spacer()
                Button(action: {
                    print("Coin was saved")
                
                }, label: {
                    Text("Save")
                        .padding()
                        .frame(width: 200, height: 50)
                        .foregroundColor(Color.white)
                        .background(Color.init(red:0.455, green: 0.447, blue: 0.871))
                        .cornerRadius(20)
                }).padding()
                Spacer()
            }
            
            
        }
        .frame(height: 300)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0.0, y: 1.0)
    }
}
