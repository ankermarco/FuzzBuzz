//
//  GameTests.swift
//  FuzzBuzz
//
//  Created by Ke Ma on 31/08/2017.
//  Copyright © 2017 ke.ma. All rights reserved.
//

import XCTest

class GameTests: XCTestCase {
  
  let game = Game()
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testGameStartsAtZero()
  {
    XCTAssertEqual(0, game.score, "Game score should start at zero")
  }
  
  func testOnPlayScoreIncremented()
  {
    let response = game.play(move: .number)
    XCTAssertEqual(1, response.score, "Game score should increase 1 after play once")
  }
  
  func testOnPlayScoreIncrementedTwice()
  {
    game.score = 1
    let response = game.play(move: .number)
    XCTAssertEqual(2, response.score, "Game score should increase 2 after play twice")
  }
  
  func testIfMoveIsRight()
  {
    game.score = 2
    let result = game.play(move: .fuzz)
    XCTAssertEqual(.rightMove,result.status)
  }
  
  func testIfMoveIsWrong()
  {
    game.score = 1
    let result = game.play(move: .fuzz)
    XCTAssertEqual(.wrongMove, result.status)
  }
  
  func testCorrectBuzzMove()
  {
    game.score = 4
    let result = game.play(move: .buzz)
    XCTAssertEqual(.rightMove, result.status)
  }
  
  func testWrongBuzzMove()
  {
    game.score = 5
    let result = game.play(move: .buzz)
    XCTAssertEqual(.wrongMove, result.status)
  }
  
  func testCorrectFizzBuzzMove()
  {
    game.score = 14
    let result = game.play(move: .fuzzBuzz)
    XCTAssertEqual(.rightMove, result.status)
  }
  
  func testWrongFizzBuzzMove()
  {
    game.score = 5
    let result = game.play(move: .fuzzBuzz)
    XCTAssertFalse(result.status == .rightMove)
  }
  
  func testCorrectNumberMove()
  {
    game.score = 3
    let result = game.play(move: .number)
    XCTAssertTrue(result.status == .rightMove)
  }
  
  func testWrongNumberMove()
  {
    game.score = 2
    let result = game.play(move: .number)
    XCTAssertFalse(result.status == .rightMove)
  }
  
  func testIfWrongMoveDontIncrementScore()
  {
    game.score = 1
    let response = game.play(move: .fuzz)
    XCTAssertEqual(1, response.score, "Score should be 1 since play the wrong move")
  }
  
  func testPlayShouldReturnIfMoveRight()
  {
    let response = game.play(move: .number)
    XCTAssertNotNil(response.status)
  }
  
  func testPlayShouldReturnScoreIfMoveRight()
  {
    let response = game.play(move: .number)
    XCTAssertNotNil(response.score)
  }
  
  func testGameShouldBeNewWhenStart()
  {
    let gameStatus = game.status
    XCTAssertEqual(.new, gameStatus)
  }
  
  func testGameShouldBeWrongMoveAfterWrongMove()
  {
    game.score = 1
    let result = game.play(move: .fuzz)
    XCTAssertEqual(.wrongMove, result.status)
  }
}
