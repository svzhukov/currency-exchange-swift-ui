//
//  Constants.swift
//  CurrencyExchangeSwiftUI
//
//  Created by Sasha Zhukov on 25.11.2024.
//

import SwiftUI

struct Constants {
    static let cornerRadius: CGFloat = 12
    
    // MARK: - Currency
    enum CurrencyType: String, CaseIterable {
        case gel = "GEL"
        case usd = "USD"
        case eur = "EUR"
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
        
        var sortOrder: Int {
            switch self {
            case .gel:
                return 0
            case .usd:
                return 1
            case .eur:
                return 2
            case .rub:
                return 3
            case .try:
                return 4
            case .amd:
                return 5
            case .gbp:
                return 6
            case .azn:
                return 7
            case .uah:
                return 8
            case .kzt:
                return 9
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
    
    // MARK: - Network
    enum APIType: Codable {
        case twelvedata
        case myfin
        
        var endpoint: String {
            switch self {
            case.twelvedata:
                return "https://api.twelvedata.com/time_series"
            case.myfin:
                return "https://myfin.ge/api/exchangeRates"
            }
        }
        
        var apikey: String {
            switch self {
            case.twelvedata:
                return Bundle.main.infoDictionary?["TWELVE_API_KEY"] as? String ?? "no twelvedata apikey found"
            case.myfin:
                return "muffin"
            }
        }
        
        var cacheKey: String {
            switch self {
            case .twelvedata:
                return "TwelveExchangeRateModelCache"
            case .myfin:
                return "MyfinExchangeRateModelCache"
            }
        }
        
        var timestampKey: String {
            switch self {
            case .twelvedata:
                return "TwelveExchangeRateModelTimestamp"
            case .myfin:
                return "MyfinExchangeRateModelTimestamp"
            }
        }
    }
    
    enum Network  {
        enum Method: String {
            case get = "GET"
            case post = "POST"
        }
        
        enum Headers {
            case json
            
            var dictionary: [String: String] {
                switch self {
                case .json:
                    return ["Content-Type": "application/json"]
                }
            }
        }
    }
    
    // MARK: - Language
    enum Language: String, CaseIterable, Codable {
        case ru = "ru"
        case en = "en"
        
        static var cacheKey: String {
            return "CurrentAppLanguageCacheKey"
        }
        
        static var defaultLanguage: Language {
            return self.en
        }
        
        var flag: String {
            switch self {
            case .ru:
                return "🇷🇺"
            case .en:
                return "🇺🇸"
            }
        }
    }
    
    // MARK: - Theme and Colors
    enum Theme: CaseIterable, Codable {
        case light
        case dark
        
        static var cacheKey: String {
            return "CurrentAppThemeCacheKey"
        }
                
        var backgroundColor: Color {
            switch self {
            case .light:
                return .white
            case .dark:
                return .black
            }
        }
        
        var secondaryBackgroundColor: Color {
            switch self {
            case .light:
                return .gray.opacity(0.15)
            case .dark:
                return .white.opacity(0.15)
            }
        }
        
        var textColor: Color {
            switch self {
            case .light:
                return .black
            case .dark:
                return .white
            }
        }
        
        var secondaryTextColor: Color {
            switch self {
            case .light:
                return .secondary
            case .dark:
                return .white.opacity(0.5)
            }
        }
        
        var accentColor: Color {
            switch self {
            case .light, .dark:
                return .red
            }
        }
        
        var chartColor: Color {
            switch self {
            case .light, .dark:
                return .blue.opacity(1)
            }
        }
        
        var actionableColor: Color {
            switch self {
            case .light:
                return .blue
            case .dark:
                return .blue
            }
        }
        
        var themeSwitcherColor: Color {
            switch self {
            case .light:
                return .yellow.opacity(0.8)
            case .dark:
                return .indigo.opacity(0.8)
            }
        }
    }
    
    static var selectedCurrenciesCacheKey: String {
        return "SelectedCurrenciesCacheKey"
    }
    
    // MARK: - Options
    enum City: String, CaseIterable, Codable {
        case tbilisi = "Tbilisi"
        case batumi = "Batumi"
        case kutaisi = "Kutaisi"
        
        static var cacheKey: String {
            return "CityCacheKey"
        }
    }
}
