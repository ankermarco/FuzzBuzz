//
//  Game.swift
//  FuzzBuzz
//
//  Created by Ke Ma on 31/08/2017.
//  Copyright © 2017 ke.ma. All rights reserved.
//
enum GameStaus
{
  case new
  case wrongMove
  case rightMove
}

class Game
{
  var score = 0
  let brain: GameBrain
  var status: GameStaus
  
  init() {
    score = 0
    brain = GameBrain()
    status = .new
  }
  
  func play(move: Move) -> (status: GameStaus, score: Int)
  {
    let result = brain.check(score + 1)
    
    if result == move
    {
      score += 1
      return (.rightMove, score)
    }
    else
    {
      status = .wrongMove
      return (.wrongMove, score)
    }
  }
}
