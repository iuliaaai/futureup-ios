//
//  SplashScreen.swift
//  future-up-ios
//
//  Created by Alex Bardea on 22.03.2022.
//

import SwiftUI

@available(iOS 15.0, *)
struct SplashScreen: View {
    @StateObject var viewModel = HomeViewModel()
    @State var showDashboard: Bool = false
    var body: some View {
        DashboardScreen().environmentObject(viewModel)
        
            // Comment those lines for hiding launchScreen
            .overlay(Image("launchScreen")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
                .opacity(showDashboard ? 0 : 1)
                .onAppear {
                    DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1.5) { showDashboard = true }
                }
                .animation(.easeInOut))
    }
}

@available(iOS 15.0, *)
struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
