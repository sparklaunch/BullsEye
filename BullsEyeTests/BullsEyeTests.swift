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
    func testExample() throws {
        XCTAssertEqual(game.points(sliderValue: 50), 999)
    }
}
