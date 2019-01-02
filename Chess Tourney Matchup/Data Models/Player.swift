//
//  Player.swift
//  Chess Tourney Matchup
//
//  Created by Ben Lee on 12/6/18.
//  Copyright © 2018 Ben Lee. All rights reserved.
//

import Foundation

struct Player {
    var name: String
    var boardColor: String
    var didWin: Bool
    var didLose: Bool
    var didDraw: Bool
    var place: Int
    var totalWins: Int = 0
    var totalLosses: Int = 0
    var totalScore: Double = 0
    var scores: [Double]
    var previousColor: String
    
    
    init(name: String?, boardColor: String?, didWin: Bool?, didLose: Bool?, didDraw: Bool?, place: Int?, totalWins: Int?, totalLosses: Int?, totalScore: Double?, scores: [Double]?, previousColor: String?) {
        self.name = name as? String ?? ""
        self.boardColor = boardColor as? String ?? "none"
        self.didWin = didWin as? Bool ?? false
        self.didLose = didLose as? Bool ?? false
        self.didDraw = didDraw as? Bool ?? false
        self.place = place as? Int ?? 0
        self.totalWins = totalWins as? Int ?? 0
        self.totalLosses = totalLosses as? Int ?? 0
        self.totalScore = totalScore as? Double ?? 0
        self.scores = scores as? [Double] ?? []
        self.previousColor = previousColor as? String ?? "none"
    }
}

struct MatchPair {
    var player1: Player
    var player2: Player
    var pair: [Player]
    var result: Result
    var matchComplete: Bool
    init(player1: Player?, player2: Player?, players: [Player]?, result: Result?, matchComplete: Bool?) {
        self.player1 = player1 as? Player ?? Player(name: nil, boardColor: nil, didWin: nil, didLose: nil, didDraw: nil, place: nil, totalWins: nil, totalLosses: nil, totalScore: nil, scores: nil, previousColor: nil)
        self.player2 = player2 ?? Player(name: nil, boardColor: nil, didWin: nil, didLose: nil, didDraw: nil, place: nil, totalWins: nil, totalLosses: nil, totalScore: nil, scores: nil, previousColor: nil)
        self.pair = [self.player1, self.player2]
        self.result = result ?? Result(won: nil, lost: nil, drew: nil)
        self.matchComplete = matchComplete ?? false
    }
}

struct Round {
    let players: [Player]
    let roundNumber: Int
    let isFirstRound: Bool
    let matchPairs: [MatchPair]
    let winnersGroup: [Player]
    let losersGroup:[Player]
    init(players: [Player], roundNumber: Int, isFirstRound: Bool, matchPairs: [MatchPair], winnersGroup: [Player], losersGroup: [Player]) {
        self.players = players
        self.roundNumber = roundNumber
        self.isFirstRound = isFirstRound
        self.matchPairs = matchPairs
        self.winnersGroup = winnersGroup
        self.losersGroup = losersGroup
    }
}
