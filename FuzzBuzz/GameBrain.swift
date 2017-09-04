//
//  GameBrain.swift
//  FuzzBuzz
//
//  Created by Ke Ma on 31/08/2017.
//  Copyright © 2017 ke.ma. All rights reserved.
//

class GameBrain
{
  func isMultipleOfThree(_ number: Int) -> Bool
  {
    return number.isMultipleOf(3)
  }
  
  func isMultipleOfFive(_ number: Int) -> Bool
  {
    return number.isMultipleOf(5)
  }
  
  func isMultipleOfThreeAndFive(_ number: Int) -> Bool
  {
    var isMultipleOfThreeAndFive = false
    
    if isMultipleOfThree(number) && isMultipleOfFive(number) {
      isMultipleOfThreeAndFive = true
    }
    
    return isMultipleOfThreeAndFive
  }
  
  func check(_ number: Int) -> Move
  {
    var result: Move
    
    if number.isMultipleOf(3) && number.isMultipleOf(5)
    {
      result = .fuzzBuzz
    }
    else if number.isMultipleOf(3)
    {
      result = .fuzz
    }
    else if number.isMultipleOf(5)
    {
      result = .buzz
    }
    else
    {
      result = .number
    }
    
    return result
  }
}

extension Int
{
  // Check if self is a multiple of give number 
  // e.g.
  // check if 15 is a multiple of 3:
  //
  // 15.isMultipleOf(3)
  func isMultipleOf(_ number: Int) -> Bool
  {
    return self % number == 0
  }
}
