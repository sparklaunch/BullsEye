//
//  Game.swift
//  BullsEye (iOS)
//
//  Created by Jinwook Kim on 2022/03/29.
//

import Foundation

struct LeaderboardEntry {
    let score: Int
    let date: Date
}

struct Game {
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    init(loadTestData: Bool = false) {
        if loadTestData {
            let testLeaderboardEntry: LeaderboardEntry = LeaderboardEntry(score: 100, date: Date())
            leaderboardEntries.append(testLeaderboardEntry)
            let anotherTestLeaderboardEntry: LeaderboardEntry = LeaderboardEntry(score: 80, date: Date())
            leaderboardEntries.append(anotherTestLeaderboardEntry)
            let stillAnotherTestLeaderboardEntry: LeaderboardEntry = LeaderboardEntry(score: 120, date: Date())
            leaderboardEntries.append(stillAnotherTestLeaderboardEntry)
        }
    }
    func points(sliderValue: Int) -> Int {
        if abs(sliderValue - target) == 1 {
            return 99 + 50
        }
        else if sliderValue == target {
            return 100 + 100
        }
        else {
            return 100 - abs(self.target - sliderValue)
        }
    }
    mutating func restart() -> Void {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
    mutating func storeScore(with points: Int) -> Void {
        addToLeaderboard(with: points)
        score += points
    }
    mutating func nextRound() -> Void {
        target = Int.random(in: 1...100)
        round += 1
    }
    mutating func addToLeaderboard(with score: Int) -> Void {
        let newLeaderboardEntry: LeaderboardEntry = LeaderboardEntry(score: score, date: Date())
        leaderboardEntries.append(newLeaderboardEntry)
        leaderboardEntries.sort {
            $0.score > $1.score
        }
    }
}
