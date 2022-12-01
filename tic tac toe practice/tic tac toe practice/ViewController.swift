//
//  ViewController.swift
//  tic tac toe practice
//
//  Created by ranjan on 03/10/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet var ticBtns: [UIButton]!
    
    let winniScenarios = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var gameIsActive = true
    var activePlayer = 1
    var count = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onTapOfTicBtns(_ sender: UIButton) {
        if gameIsActive && gameState[sender.tag] == 0 {
            gameState[sender.tag] = activePlayer
            if activePlayer == 1 {
                sender.setTitle("X", for: .normal)
                activePlayer = 2
            } else {
                sender.setTitle("O", for: .normal)
                activePlayer = 1
            }
            for scenario in winniScenarios {
                if gameState[scenario[0]] != 0 && gameState[scenario[0]] == gameState[scenario[1]] && gameState[scenario[1]] == gameState[scenario[2]] {
                    gameIsActive = false
                    if gameState[scenario[0]] == 1 {
                        winnerLabel.text = "player 1 won"
                        
                    } else {
                        winnerLabel.text = "player 2 won"
                    }
                    
                }
                if gameIsActive {
                    if gameState[0] == 0 || gameState[1] == 0 || gameState[2] == 0 || gameState[3] == 0 || gameState[4] == 0 || gameState[5] == 0 || gameState[6] == 0 || gameState[7] == 0 || gameState[8] == 0 {
                            continue
                        } else {
                            winnerLabel.text = "Match Draw"
                        }
                }
            }
        }
    }
    
    @IBAction func onTapOfStartAgainBtn(_ sender: UIButton) {
        winnerLabel.text = "Winner Player"
        for btn in ticBtns {
            btn.setTitle("", for: .normal)

        }
         gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
         gameIsActive = true
         activePlayer = 1
         count = 1
    }
}

