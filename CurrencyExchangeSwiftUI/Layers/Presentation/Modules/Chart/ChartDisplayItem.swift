//
//  RatesGraphDisplayItem.swift
//  CurrencyExchangeSwiftUI
//
//  Created by Sasha Zhukov on 07.11.2024.
//

import Foundation

struct ChartDisplayItem: Identifiable, Equatable {
    let date: Date
    let price: Double
    let id = UUID()
    
    static func mapModel(_ model: TwelvedataJSONModel) -> [ChartDisplayItem] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return model.values.compactMap { value in
            guard let price = Double(value.close) else { return nil }
            guard let date = dateFormatter.date(from: value.datetime) else { return nil }
            return ChartDisplayItem(
                date: date,
                price: 1 / price
            )
        }
    }
}

extension Array where Element == ChartDisplayItem {
    var minPrice: ChartDisplayItem? {
        self.min(by: { $0.price < $1.price })
    }
    
    var maxPrice: ChartDisplayItem? {
        self.max(by: { $0.price < $1.price })
    }
}

