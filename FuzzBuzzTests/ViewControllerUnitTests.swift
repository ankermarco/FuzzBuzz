//
//  ViewControllerUnitTests.swift
//  FuzzBuzz
//
//  Created by Ke Ma on 01/09/2017.
//  Copyright © 2017 ke.ma. All rights reserved.
//

import XCTest

class ViewControllerUnitTests: XCTestCase {
  
  var viewController: ViewController!
  
  override func setUp() {
    super.setUp()
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: self.classForCoder))
    viewController = storyboard.instantiateViewController(withIdentifier: "viewController") as! ViewController
    UIApplication.shared.keyWindow!.rootViewController = viewController
    
    let _ = viewController.view
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testMove1IncrementsScore()
  {
    let _ = viewController.play(move: .number)
    XCTAssertEqual(1, viewController.gameScore, "viewController score should be 1 after 1 move")
  }
  

  func testHasGame()
  {
    XCTAssertNotNil(viewController.game)
  }
  
  func testMoveFuzzScoreIncrement()
  {
    viewController.game?.score = 2
    viewController.play(move: .fuzz)
    XCTAssertEqual(3, viewController.gameScore, "Play Fuzz move and the score is 3")
  }
  
  func testMove3ScoreDontIncrement()
  {
    viewController.game?.score = 2
    viewController.play(move: .number)
    XCTAssertEqual(2, viewController.gameScore, "Play 3 move and the score is 2")
  }
  
  func testMoveBuzzScoreIncrement()
  {
    viewController.game?.score = 4
    viewController.play(move: .buzz)
    XCTAssertEqual(5, viewController.gameScore, "Play Buzz move and the score is 5")
  }
  
  func testMoveFuzzBuzzScoreIncrement()
  {
    viewController.game?.score = 14
    viewController.play(move: .fuzzBuzz)
    XCTAssertEqual(15, viewController.gameScore, "Play FuzzBuzz move and the score is 15")
  }
  
  func testGameFinishedWhenWrongMove()
  {
    viewController.game?.score = 2
    viewController.play(move: .number)
    XCTAssertEqual(true, viewController.gameFinished)
  }
  
  func testIfWrongMoveFuzzButtonShouldBeHidden()
  {
    viewController.game?.score = 2
    viewController.play(move: .number)
    XCTAssertEqual(true, viewController.fuzzButton.isHidden)
  }
  
  func testIfWrongMoveBuzzButtonShouldBeHidden()
  {
    viewController.game?.score = 2
    viewController.play(move: .number)
    XCTAssertEqual(true, viewController.buzzButton.isHidden)
  }
  
  func testIfWrongMoveFuzzBuzzButtonShouldBeHidden()
  {
    viewController.game?.score = 2
    viewController.play(move: .number)
    XCTAssertEqual(true, viewController.fuzzBuzzButton.isHidden)
  }
  
  func testWhenRestartGameScoreIsZero()
  {
    viewController.game?.score = 2
    viewController.play(move: .number)
    viewController.restart()
    XCTAssertEqual(viewController.game?.score, 0)
  }
  
  func testWhenRestartGameStatusIsNew()
  {
    viewController.game?.score = 2
    viewController.play(move: .number)
    XCTAssertEqual(viewController.game?.status, .wrongMove)
    viewController.restart()
    XCTAssertEqual(viewController.game?.status, .new)
  }
  
}
