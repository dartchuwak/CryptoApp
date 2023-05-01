//
//  UIAplication.swift
//  CryptoApp
//
//  Created by Evgenii Mikhailov on 01.05.2023.
//

import Foundation
import SwiftUI


extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
