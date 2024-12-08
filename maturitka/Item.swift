//
//  Item.swift
//  maturitka
//
//  Created by Maturitka on 08/12/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
