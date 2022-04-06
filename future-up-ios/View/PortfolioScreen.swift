//
//  PortfolioScreen.swift
//  future-up-ios
//
//  Created by Alex Bardea on 22.03.2022.
//

import SwiftUI

struct PortfolioScreen: View {
    // MARK: - Properties
    @EnvironmentObject var viewModel: HomeViewModel
    @Binding var showScreen: Bool
    @State var showCoinSelection: Bool = false
    @State var selected = ""
    
    // MARK: - Body
    var body: some View {
            VStack(alignment: .leading, spacing: UIViewConstants.padding) {
                topBar
                
                Text(UIViewConstants.Portfolio.portfolioTitle).padding(.leading, UIViewConstants.padding)
                
                ScrollView {
                    VStack(spacing: UIViewConstants.padding) {
                        // TO DO - view only coins from your wallet w/ ForEach
                        // Update 'value'
                        ForEach(viewModel.allCoins, id: \.tagID) { item in
                            MyCoinPortfolioView(title: item.name, abbreviation: item.symbol, marketValue: item.currentPrice, value: 1, imageUrl: item.image)
                        }
                    }
                }
                .padding(.leading, UIViewConstants.padding)
                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0.0, y: 1.0)
                
                HStack{
                    Spacer()
                    Button(action: {
                        showCoinSelection = true
                    
                    }, label: {
                        Text("+ Add new coins")
                            .padding()
                            .frame(width: 200, height: 50)
                            .foregroundColor(Color.white)
                            .background(Color.init(red:0.455, green: 0.447, blue: 0.871))
                            .cornerRadius(20)
                    })
                    .padding()
                    Spacer()
                }
               
                
                if(showCoinSelection){
                    CoinSelectionView()
                    .onTapGesture {
                        showCoinSelection = false
                    }
                }
            
            }
            .background(Color("background").ignoresSafeArea(.all))
            .ignoresSafeArea(.all, edges: .top)
            
    }
    
    // MARK: - Private
    private var topBar: some View {
        LinearGradient(
            gradient:
            Gradient(
                colors: [Color("mainCardColor1"), Color("mainCardColor2")]),
            startPoint: .top,
            endPoint: .bottom
        )
        .frame(height: UIViewConstants.Dashboard.cardHeight)
        .overlay(
            ZStack {
                Rectangle()
                    .trim(from: 0, to: 0.5)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.black, Color.white]),
                            startPoint: .topTrailing,
                            endPoint: .bottomLeading)
                    )
                    .opacity(0.08)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))

                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Image(systemName: UIViewConstants.Portfolio.backBtn).onTapGesture {
                            showScreen.toggle()
                        }
                        
                        // TO DO - change balance from UI
                        Text(UIViewConstants.Dashboard.cardTitle).font(.body).fontWeight(.regular).offset(x: 10).padding(.top, UIViewConstants.padding)
                        Text("$ \(String(format: "%.2f", myCoin.currentPrice))").font(.title).fontWeight(.bold).offset(x: 10)
                    }
                    .foregroundColor(.white)
                    Spacer()
                }
                .padding(.leading, UIViewConstants.padding)
            }
        )
        .cornerRadius(30)
        .shadow(radius: 10)
    }
}
