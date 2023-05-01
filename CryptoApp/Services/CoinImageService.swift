//
//  CoinIamgeService.swift
//  CryptoApp
//
//  Created by Evgenii Mikhailov on 01.05.2023.
//

import Foundation
import SwiftUI
import Combine


class CoinImageService {
    
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    
    
    @Published var image: UIImage? = nil
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinImage()
    }
    
    private func getCoinImage() {
        guard let url = URL(string: coin.image)
        else { return }
        
        imageSubscription =  NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] image in
                self?.image = image
                self?.imageSubscription?.cancel()
            })
    }
}

