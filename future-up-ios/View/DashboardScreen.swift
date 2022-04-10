//
//  DashboardScreen.swift
//  future-up-ios
//
//  Created by Alex Bardea on 22.03.2022.
//

import SwiftUI

@available(iOS 15.0, *)
struct DashboardScreen: View {
    // MARK: - Properties
    @State var showScreen: Bool = false
    @State var showDescription: Bool = false
    @State var selected = ""
    @State var description = ""
    
    @EnvironmentObject var viewModel: HomeViewModel

    // MARK: - Body
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 10) {
                mainTitle
                
                // TO DO - change balance from UI
                CardView(balance: myCoin.currentPrice, cardHolderName: UIDevice.current.name, color1: Color("mainCardColor1"), color2: Color("mainCardColor2"))
                    .withCardModifier()
                    .padding([.leading, .trailing], (screen.width - 0.85 * screen.width) / 2)
                    .onTapGesture { showScreen.toggle() }
                    .overlay(backgroundCards)

                mainSubtitle
                livePricesScroll
            }
            .background(Color("background"))

            PortfolioScreen(showScreen: $showScreen, convertedValue: 0).environmentObject(viewModel)
                .opacity(showScreen ? 1 : 0)
                .animation(.easeInOut)
                .statusBar(hidden: true)
            
            CoinDescriptionView(title: description, text: viewModel.allDescriptions.description.en, showDescription: $showDescription)
                .offset(y: showDescription ? 0 : UIScreen.main.bounds.height)
                .animation(.spring())
            
        }
    }

    // MARK: - Private
    private var mainTitle: some View {
        Text(UIViewConstants.Dashboard.mainTitle)
            .font(.title)
            .fontWeight(.semibold)
            .padding(.leading, UIViewConstants.padding)
    }

    private var mainSubtitle: some View {
        Text(UIViewConstants.Dashboard.mainSubtitle)
            .font(.headline)
            .fontWeight(.semibold)
            .padding(.leading, UIViewConstants.padding)
    }

    private var livePricesScroll: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 1) {
                if viewModel.isLoading { ProgressView().frame(width: screen.width, height: UIViewConstants.Dashboard.cardHeight, alignment: .center) } else {
                    ForEach(viewModel.allCoins, id: \.tagID) { cryptoCoin in
                        LivePriceCardView(title: cryptoCoin.name, value: cryptoCoin.currentPrice, percentage: cryptoCoin.priceChangePercentage24H ?? 0, imageUrl: cryptoCoin.image)
                            .environmentObject(viewModel)
                            .onTapGesture {
                                showDescription = true
                                viewModel.getCoinsDescriptionWithURLSession(id: cryptoCoin.id)
                                selected = viewModel.allDescriptions.description.en
                                description = cryptoCoin.name + " description"
                            }

                    }
                }
            }
        }.padding(.top, 10)
    }

    private var backgroundCards: some View {
        ZStack {
            CardView(balance: 0, cardHolderName: "", color1: Color.red, color2: Color.orange, isDummy: true)
                .withCardModifierBack(offset: 1)

            CardView(balance: 0, cardHolderName: "", color1: Color.blue, color2: Color.blue.opacity(0.2), isDummy: true)
                .withCardModifierBack()
        }
    }
    
}
