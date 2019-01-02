//
//  File.swift
//  Chess Tourney Matchup
//
//  Created by Ben Lee on 12/24/18.
//  Copyright © 2018 Ben Lee. All rights reserved.
//

import Foundation
struct Result {
    var won: Bool?
    var lost: Bool?
    var drew: Bool?
    
    init(won: Bool?, lost: Bool?, drew: Bool?) {
        self.won = won ?? false
        self.drew = drew ?? false
        self.lost = lost ?? false
    }
}
