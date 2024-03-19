//
//  Item.swift
//  HomeView
//
//  Created by shashwat singh   on 16/03/24.
//

import Foundation
import SwiftData

@available(iOS 17, *)
@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
