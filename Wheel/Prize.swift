//
//  Prize.swift
//  Wheel
//
//  Created by Nilar Win on 18/09/2024.
//

import Foundation

struct Prize {
    var amount: Int
    var description: String
    var priceType: PriceType
}

extension Prize {
    enum PriceType {
        case money
        case points
        case exp

        var imageName: String {
            switch self {
            case .money:
                return "prize1"
            case .points:
                return "prize1"
            case .exp:
                return "prize1"
            }
        }
    }

}

extension Prize {
    var amountFormatted: String {
        return "\(amount)"
    }
}
