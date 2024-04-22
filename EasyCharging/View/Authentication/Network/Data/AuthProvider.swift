//
//  LoginProvider.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 02/03/2023.
//

import Foundation

class AuthProvider {
    
    public static var shared: AuthProvider {
        return singleton
    }
    private static let singleton: AuthProvider = AuthProvider()
    
    func makeLoginRepository() -> AuthenticationRepository {
        let dataStore = LoginDataStore()
        return DefaultAuthenticationRepository(dataTransferService: AppDataTransferService().defaultDataTransferService, loginDataStore: dataStore)
    }
}
