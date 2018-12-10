//
//  Order.swift
//  Restaurant
//
//  Created by Wytze Dijkstra on 03/12/2018.
//  Copyright © 2018 Wytze Dijkstra. All rights reserved.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
