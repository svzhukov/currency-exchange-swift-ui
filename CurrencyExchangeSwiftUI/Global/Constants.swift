//
//  Constants.swift
//  CurrencyExchangeSwiftUI
//
//  Created by Sasha Zhukov on 25.11.2024.
//

import Foundation

enum Constants {
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
                return Bundle.main.infoDictionary?["TWELVE_API_KEY"] as? String ?? "noapikeyfound"

            case.myfin:
                return ""
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
}
