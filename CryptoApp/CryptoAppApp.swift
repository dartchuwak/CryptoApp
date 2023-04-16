//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Evgenii Mikhailov on 14.04.2023.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .toolbar(.hidden)
            }
        }
    }
}
