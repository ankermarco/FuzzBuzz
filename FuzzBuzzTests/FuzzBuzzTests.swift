//
//  FuzzBuzzTests.swift
//  FuzzBuzzTests
//
//  Created by Ke Ma on 31/08/2017.
//  Copyright © 2017 ke.ma. All rights reserved.
//

import XCTest
@testable import FuzzBuzz

class FuzzBuzzTests: XCTestCase {
  
  let brain = GameBrain()
  
  func testSixIsMultipleOfThree()
  {
    let number = 6
    XCTAssertTrue(brain.isMultipleOfThree(number), "6 is multiple of 3")
  }
  
  func testSevenIsntMultipleOfThree()
  {
    let number = 7
    XCTAssertFalse(brain.isMultipleOfThree(number), "7 isnt multiple of 3")
  }
  
  func testTenIsMultipleOfFive()
  {
    let number = 10
    XCTAssertTrue(brain.isMultipleOfFive(number), "10 is multiple of 5")
  }
  
  func testFifteenIsMultipleOfThreeAndFive()
  {
    let number = 15
    XCTAssertTrue(brain.isMultipleOfThreeAndFive(number), "15 is multiple of both 3 and 5")
  }
  
  func testSixteenIsntMultipleOfThreeAndFive()
  {
    let number = 16
    XCTAssertFalse(brain.isMultipleOfThreeAndFive(number), "16 isnt multiple of both 3 and 5")
  }
  
  func testWhenNumberIsMultipleOfThreeItReturnsFuzz()
  {
    let number = 3
    XCTAssertEqual(Move.fuzz, brain.check(number), "It should return Fuzz when a number is multiple of 3")
  }
  
  func testWhenNumberIsMultipleOfFiveItReturnsBuzz()
  {
    let number = 5
    XCTAssertEqual(Move.buzz, brain.check(number), "It should return Buzz when a number is multiple of 5")
  }
  
  func testWhenNumberIsMultipleOfThreeAndFiveItReturnsFuzzBuzz()
  {
    let number = 15
    XCTAssertEqual(Move.fuzzBuzz, brain.check(number), "It should return FuzzBuzz when a number is multiple of both 3 and 5")
  }
  
  func testWhenNumberIsntMultipleOfThreeNorFiveItReturnsTheNumber()
  {
    let number = 1
    XCTAssertEqual(Move.number, brain.check(number), "It should return 1 when a number isnt multiple of neither 3 nor 5")
  }
}
