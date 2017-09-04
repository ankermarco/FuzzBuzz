//
//  FuzzBuzzUITests.swift
//  FuzzBuzz
//
//  Created by Ke Ma on 01/09/2017.
//  Copyright © 2017 ke.ma. All rights reserved.
//

import XCTest

class FuzzBuzzUITests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    XCUIApplication().launch()
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testTapNumberButtonScoreIncrement()
  {
    let app = XCUIApplication()
    let numberButton = app.buttons["numberButton"]
    
    numberButton.tap()
    let newScore = numberButton.label
    XCTAssertEqual(newScore, "1", "score should increment by 1")
  }
  
  func testNumberButtonTappedTwiceScoreIs2()
  {
    let app = XCUIApplication()
    let numberButton = app.buttons["numberButton"]
    numberButton.tap()
    numberButton.tap()
    
    let newScore = numberButton.label
    XCTAssertEqual("2", newScore, "tapped number button twice score should increment by 2")
    
  }
  
  func testFuzzButtonTappedScoreIncrement()
  {
    let app = XCUIApplication()
    let fuzzButton = app.buttons["fuzzButton"]
    let numberButton = app.buttons["numberButton"]
    
    numberButton.tap()
    numberButton.tap()
    fuzzButton.tap()
    
    let newScore = numberButton.label
    XCTAssertEqual(newScore, "3", "score should 3")
  }
  
  func testBuzzButtonTappedScoreIncrement()
  {
    let app = XCUIApplication()
    let numberButton = app.buttons["numberButton"]
    let fuzzButton = app.buttons["fuzzButton"]
    let buzzButton = app.buttons["buzzButton"]
    
    numberButton.tap()
    numberButton.tap()
    fuzzButton.tap()
    numberButton.tap()
    buzzButton.tap()
    
    let newScore = numberButton.label
    XCTAssertEqual(newScore, "5", "score should 5")
  }
  
  func testFuzzBuzzButtonTappedScoreIncrement()
  {
    let app = XCUIApplication()
    let numberButton = app.buttons["numberButton"]
    let fuzzButton = app.buttons["fuzzButton"]
    let buzzButton = app.buttons["buzzButton"]
    let fuzzBuzzButton = app.buttons["fuzzBuzzButton"]
    
    numberButton.tap()
    numberButton.tap()
    fuzzButton.tap()
    numberButton.tap()
    buzzButton.tap()
    fuzzButton.tap()
    numberButton.tap()
    numberButton.tap()
    fuzzButton.tap()
    buzzButton.tap()
    numberButton.tap()
    fuzzButton.tap()
    numberButton.tap()
    numberButton.tap()
    fuzzBuzzButton.tap()
    
    let newScore = numberButton.label
    XCTAssertEqual(newScore, "15", "score should 15")
  }
  
  func testWhenUserMakesErrorHideAllButtonsExceptNumberButton()
  {
    let app = XCUIApplication()
    let numberButton = app.buttons["numberButton"]
    let fuzzButton = app.buttons["fuzzButton"]
    let buzzButton = app.buttons["buzzButton"]
    let fuzzBuzzButton = app.buttons["fuzzBuzzButton"]
    
    numberButton.tap()
    numberButton.tap()
    numberButton.tap()
    
    XCTAssertFalse(fuzzButton.exists, "fuzz button should be hidden")
    XCTAssertFalse(buzzButton.exists, "buzz button should be hidden")
    XCTAssertFalse(fuzzBuzzButton.exists, "fuzz buzz button should be hidden")
  }
  
  func testWhenTapRestartButtonAllButtonsAreShowing()
  {
    let app = XCUIApplication()
    let numberButton = app.buttons["numberButton"]
    let fuzzButton = app.buttons["fuzzButton"]
    let buzzButton = app.buttons["buzzButton"]
    let fuzzBuzzButton = app.buttons["fuzzBuzzButton"]
    
    let restartButton = app.buttons["restartButton"]
    
    numberButton.tap()
    numberButton.tap()
    numberButton.tap()
    
    restartButton.tap()
    
    XCTAssertTrue(fuzzButton.exists, "fuzz button should exist")
    XCTAssertTrue(buzzButton.exists, "buzz button should exist")
    XCTAssertTrue(fuzzBuzzButton.exists, "fuzz buzz button should exist")
  }
  
  func testWhenTapRestartButtonNumberButtonLabelShouldBeZero()
  {
    let app = XCUIApplication()
    let numberButton = app.buttons["numberButton"]
    let restartButton = app.buttons["restartButton"]
    
    numberButton.tap()
    numberButton.tap()
    numberButton.tap()
    
    restartButton.tap()
    XCTAssertEqual(numberButton.label, "0")
  }
  
  
}
