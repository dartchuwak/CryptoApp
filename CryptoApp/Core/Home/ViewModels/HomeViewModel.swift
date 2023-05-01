//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Evgenii Mikhailov on 18.04.2023.
//

import Foundation
import Combine


class HomeViewModel: ObservableObject {
    
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    @Published var serchText: String = ""
    
    private let networkService = CoinDataService()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
       addSubscribers()
    }
    
    func addSubscribers() {
        networkService.$allCoins
            .sink { [weak self] coins in
                self?.allCoins = coins
            }
            .store(in: &cancellables)
    }
}
