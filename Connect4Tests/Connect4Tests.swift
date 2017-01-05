//
//  Connect4Tests.swift
//  Connect4Tests
//
//  Created by Jonathon Day on 1/4/17.
//  Copyright © 2017 dayj. All rights reserved.
//

import XCTest
@testable import Connect4

class Connect4Tests: XCTestCase {
    
    func testAvailablePlaces() {
        let testBoard = Board()
        testBoard.places[0] = Array(repeating: Board.Disc.red, count: 6)
        let result = testBoard.availableColumns
        let expected = [1, 2, 3, 4, 5, 6]
        XCTAssertTrue(result == expected)
    }
    
    func testDropDisc() {
        let testBoard = Board()
        testBoard.dropDisc(column: 0)
        XCTAssert(testBoard.places[0][0] == .red)
    }
    
    func testCurrentDisc() {
        let testBoard = Board()
        testBoard.dropDisc(column: 0)
        XCTAssert(testBoard.currentDisc == .yellow)
        testBoard.dropDisc(column: 2)
        XCTAssert(testBoard.currentDisc == .red)
    }
    
    func testWinnerRed() {
        let testBoard = Board()
        testBoard.dropDisc(column: 0)
        testBoard.dropDisc(column: 0)
        testBoard.dropDisc(column: 1)
        testBoard.dropDisc(column: 1)
        testBoard.dropDisc(column: 2)
        testBoard.dropDisc(column: 2)
        testBoard.dropDisc(column: 3)
        XCTAssert(testBoard.winner == .red)
    }
    
    func testWinnerYellow() {
        let testBoard = Board()
        testBoard.dropDisc(column: 0)
        testBoard.dropDisc(column: 1)
        testBoard.dropDisc(column: 1)
        testBoard.dropDisc(column: 2)
        testBoard.dropDisc(column: 2)
        testBoard.dropDisc(column: 3)
        testBoard.dropDisc(column: 3)
        testBoard.dropDisc(column: 4)
        testBoard.dropDisc(column: 4)
        XCTAssert(testBoard.winner == .yellow)
    }
    

}
