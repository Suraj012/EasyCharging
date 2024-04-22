//
//  SwiftUI_BoilerPlateApp.swift
//  SwiftUI-BoilerPlate
//
//  Created by Suraj Bhandari on 14/03/2023.
//

import SwiftUI

@main
struct SwiftUI_BoilerPlateApp: App {
    init() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel(authRepository: AuthProvider.shared.makeLoginRepository()))
        }
    }
}
