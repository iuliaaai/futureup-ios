//
//  HomeViewModel.swift
//  future-up-ios
//
//  Created by Alex Bardea on 22.03.2022.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    
    // MARK: - Properties
    // TO DO - Store final-balance and all my crypto coins
    // @Published var allCoins: [CryptoCoinModel] = [] -> Update CryptoCoinModel
    // @Published var finalBalance: Double = 0.0
    
    @Published var allCoins: [CryptoCoinModel] = []
    @Published var isLoading: Bool = true
    
    init() {
        getCoinsWithURLSession()
        reloadAllMyCoins()
    }
    
    func reloadAllMyCoins() {} // Fetch your coins from wallet
    
    func storeAllMyCoins() {} // Store your coins to wallet
        
    // Download data using URLSession
    
    func getCoinsWithURLSession() {
        guard let url = URL(string: UIViewConstants.Networking.url) else { return }
         
        downloadData(fromURL: url) { returnedData in
            if let data = returnedData {
                guard let decodedCoins = try? JSONDecoder().decode([CryptoCoinModel].self, from: data) else { return }
                DispatchQueue.main.async { [weak self] in
                    
                    // Decoded data using CryptoCoinModel
                    self?.allCoins = decodedCoins
                    self?.isLoading = false
                }
            } else {
                print("No data returned.")
            }
        }
    }
    
    // Handle session w/ @escaping
    func downloadData(fromURL url: URL, completionHandler: @escaping (_ data: Data?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200, response.statusCode < 300
            else {
                print("Error downloading data.")
                completionHandler(nil)
                return
            }

            completionHandler(data)

        }.resume()
    }
}
