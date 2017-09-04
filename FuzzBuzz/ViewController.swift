//
//  ViewController.swift
//  FuzzBuzz
//
//  Created by Ke Ma on 31/08/2017.
//  Copyright © 2017 ke.ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var numberButton: UIButton!
  
  @IBOutlet weak var fuzzButton: UIButton!
  
  @IBOutlet weak var buzzButton: UIButton!
  
  @IBOutlet weak var fuzzBuzzButton: UIButton!
  
  @IBOutlet weak var playAgainButton: UIButton!
  
  var game: Game? {
    didSet {
      guard let unwrappedGame = game else {
        return
      }
      gameScore = unwrappedGame.score
      gameFinished = false
    }
  }
  
  var gameScore: Int? {
    didSet {
      guard let unwrappedGameScore = gameScore else {
        return
      }
      numberButton.setTitle(String(describing: unwrappedGameScore), for: .normal)
    }
  }
  
  var gameFinished: Bool = false {
    didSet {
      numberButton.isEnabled = !gameFinished
      fuzzButton.isHidden = gameFinished
      buzzButton.isHidden = gameFinished
      fuzzBuzzButton.isHidden = gameFinished
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    game = Game()
    
    guard let checkedGame = game else {
      return
    }
    
    gameScore = checkedGame.score
  }
  
  func play(move: Move)
  {
    guard let game = self.game else {
      return
    }
    // When Playing Game background color to purple
    self.view.backgroundColor = UIColor.init(red: 98.0/255, green: 87.0/255, blue: 114.0/255, alpha: 1.0)
    
    let response = game.play(move: move)
    gameScore = response.score
    
    switch response.status {
    case .new, .rightMove:
      gameFinished = false
    case .wrongMove:
      gameFinished = true
    }
  }
  
  func restart()
  {
    game = Game()
    // Game restart background color back to Green
    self.view.backgroundColor = UIColor.init(red: 169.0/255, green: 238.0/255, blue: 230.0/255, alpha: 1.0)
  }

  @IBAction func buttonTapped(_ sender: UIButton)
  {
    switch sender {
    case numberButton:
      play(move: .number)
    case fuzzButton:
      play(move: .fuzz)
    case buzzButton:
      play(move: .buzz)
    case fuzzBuzzButton:
      play(move: .fuzzBuzz)
    case playAgainButton:
      restart()
    default:
      print("do nothing")
    }
    
    if gameFinished
    {
      // Game over background color to Red
      self.view.backgroundColor = UIColor.init(red: 234.0/255.0, green: 129.0/255.0, blue: 129.0/255.0, alpha: 1.0)
    }
  }
}

