//
//  Currency.swift
//  CurrencyExchangeSwiftUI
//
//  Created by Sasha Zhukov on 25.11.2024.
//

import Foundation

struct Currency: Identifiable {
    let id = UUID()
    let buy: Double
    let sell: Double
    let type: CurrencyType
    
    enum CurrencyType: String {
        case usd = "USD"
        case eur = "EUR"
        case gel = "GEL"
        case rub = "RUB"
        case `try` = "TRY"
        case amd = "AMD"
        case gbp = "GBP"
        case azn = "AZN"
        case uah = "AUH"
        case kzt = "KZT"
        
        var flag: String {
            switch self {
            case .usd:
                return "🇺🇸"
            case .eur:
                return "🇪🇺"
            case .gel:
                return "🇬🇪"
            case .rub:
                return "🇷🇺"
            case .try:
                return "🇹🇷"
            case .amd:
                return "🇦🇲"
            case .gbp:
                return "🇬🇧"
            case .azn:
                return "🇦🇿"
            case .uah:
                return "🇺🇦"
            case .kzt:
                return "🇰🇿"
            }
        }
        
        var symbol: String {
            switch self {
            case .usd:
                return "$"
            case .eur:
                return "€"
            case .gel:
                return "₾"
            case .rub:
                return "₽"
            case .try:
                return "₺"
            case .amd:
                return "֏"
            case .gbp:
                return "£"
            case .azn:
                return "₼"
            case .uah:
                return "₴"
            case .kzt:
                return "₸"
            }
        }
        
        init?(rawValue: String) {
            switch rawValue.uppercased() {
            case "USD":
                self = .usd
            case "EUR":
                self = .eur
            case "GEL":
                self = .gel
            case "RUB":
                self = .rub
            case "TRY":
                self = .try
            case "AMD":
                self = .amd
            case "GBP":
                self = .gbp
            case "AZN":
                self = .azn
            case "UAH":
                self = .uah
            case "KZT":
                self = .kzt
            default:
                print("Currency raw value for string not found: \(rawValue)")
                return nil
            }
        }
    }
}
