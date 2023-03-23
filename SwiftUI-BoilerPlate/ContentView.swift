//
//  ContentView.swift
//  SwiftUI-BoilerPlate
//
//  Created by Suraj Bhandari on 14/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    init() {
        ThemeType.toggled(ThemeType.light)()
    }
    
    let themePub = NotificationCenter.default
        .publisher(for: .themeToggled)
    
    var body: some View {
        if(viewModel.isAuthenticated) {
            MainView()
        }else {
            WelcomeView()
        }
    }
}

