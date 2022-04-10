//
//  MyCoinPortfolioView.swift
//  future-up-ios
//
//  Created by Alex Bardea on 24.03.2022.
//

import SwiftUI

struct MyCoinPortfolioView: View {
    var title: String
    var abbreviation: String
    var marketValue: Double
    var value: Double
    var imageUrl: String
        
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(title).font(.title2).fontWeight(.medium)
                Spacer()
                Text(String(format: "%.2f", marketValue)).font(.title3).fontWeight(.semibold)
            }

            HStack {
                HStack {
                    CustomImageView(hasCircle: false, urlString: imageUrl, percentage: 0)
                    Text(abbreviation).font(.caption).fontWeight(.light)
                }
                Spacer()
                Text(String(format: "%.2f", value)).font(.caption).fontWeight(.light)
            }
        }
        .padding(UIViewConstants.padding)
        .frame(width: screen.width - 40)
        
        .background(Color.white)
        .cornerRadius(20)
    }
    
}
