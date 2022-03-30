//
//  BullsEyeTests.swift
//  BullsEyeTests
//
//  Created by Jinwook Kim on 2022/03/30.
//

import XCTest
@testable import BullsEye

class BullsEyeTests: XCTestCase {
    var game: Game!
    override func setUpWithError() throws {
        self.game = Game()
    }
    override func tearDownWithError() throws {
        self.game = nil
    }
    func testScorePositive() -> Void {
        let guess: Int = game.target + 5
        let score: Int = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    func testScoreNegative() -> Void {
        let guess: Int = game.target - 5
        let score: Int = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
}
