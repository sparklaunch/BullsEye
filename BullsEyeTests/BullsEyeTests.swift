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
    func testNewRound() -> Void {
        game.nextRound()
        XCTAssertEqual(game.round, 2)
    }
    func testAlmostGotItRightPositive() -> Void {
        let guess: Int = game.target - 1
        let score: Int = game.points(sliderValue: guess)
        let bonusPoint: Int = 50
        XCTAssertEqual(score, 99 + bonusPoint)
    }
    func testAlmostGotItRightNegative() -> Void {
        let guess: Int = game.target + 1
        let score: Int = game.points(sliderValue: guess)
        let bonusPoint: Int = 50
        XCTAssertEqual(score, 99 + bonusPoint)
    }
    func testGotItRight() -> Void {
        let guess: Int = game.target
        let score: Int = game.points(sliderValue: guess)
        let bonusPoint: Int = 100
        XCTAssertEqual(score, 100 + bonusPoint)
    }
    func testRestart() -> Void {
        game.restart()
        XCTAssertEqual(game.score, 0)
        XCTAssertEqual(game.round, 1)
    }
}
