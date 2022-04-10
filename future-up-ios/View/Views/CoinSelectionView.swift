//
//  CoinSelectionView.swift
//  future-up-ios
//
//  Created by Iulia Ionascu on 06.04.2022.
//

import SwiftUI

struct CoinSelectionView: View{
    @EnvironmentObject var viewModel: HomeViewModel
    
    @Binding var showCoinSelection: Bool
    @State var value: String
    @State var selectedCoin = ""
    @State var currentPrice: Double
    @Binding var convertedValue: Double
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        ZStack{
            VStack(alignment: .leading){
                
                HStack(){
                    Spacer()
                    Button(
                        action: {
                            showCoinSelection.toggle()
                        },
                        label: {
                            Text("X")
                                .frame(width: 30, height: 30)
                                .background(Color.init(red:0.855, green: 0.447, blue: 0.771))
                                .cornerRadius(50)
                                .foregroundColor(.black)
                        })
                }
                
                
                Text("Select coin").fontWeight(.semibold).padding(10)
                
                ScrollView (.horizontal) {
                     HStack {
                         ForEach(viewModel.allCoins, id: \.tagID) { cryptoCoin in
                             VStack(alignment: .leading, spacing: 10) {
                                 CustomImageView(hasCircle: true, urlString: cryptoCoin.image, percentage: cryptoCoin.priceChangePercentage24H ?? 0)
                                 Text(cryptoCoin.name)
                             }
                             .padding(10)
                             .onTapGesture {
                                 selectedCoin = cryptoCoin.tagID
                                 currentPrice = cryptoCoin.currentPrice
                                 
                             }
                         }
                     }
                }.padding(10)
                
                Text("How much?").fontWeight(.semibold).padding(10)
                
                TextField("Value", text: $value)
                    .textFieldStyle(.roundedBorder)
                    .padding(10)
                    
                    
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        //conversion
                        if value != ""{
                            viewModel.allCoins[Int(selectedCoin) ?? 0].valueCurrentHoldings = currentPrice * Double(value)!
                            viewModel.updateWallet()
//                            convertedValue = currentPrice * Double(value)!
//                            viewModel.finalBalance = convertedValue
                            
                        }
                        
                        
                    }, label: {
                        Text("Save")
                            .padding(20)
                            .frame(width: 200, height: 50)
                            .foregroundColor(Color.white)
                            .background(Color.init(red:0.455, green: 0.447, blue: 0.871))
                            .cornerRadius(20)
                    }).padding()
                    Spacer()
                }
                
                
            }
            .frame(height: 500)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0.0, y: 1.0)
        }
            
    }
    
        
}
