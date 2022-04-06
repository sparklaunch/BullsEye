//
//  Game.swift
//  BullsEye (iOS)
//
//  Created by Jinwook Kim on 2022/03/29.
//

import Foundation

struct Game {
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
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
    mutating func storeScore(with points: Int) -> Void {
        score += points
    }
    mutating func nextRound() -> Void {
        target = Int.random(in: 1...100)
        round += 1
    }
}
