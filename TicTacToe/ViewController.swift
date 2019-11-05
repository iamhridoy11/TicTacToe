//
//  ViewController.swift
//  TicTacToe
//
//  Created by Mostafizur Rahman Hridoy on 2019-10-10.
//  Copyright © 2019 Mostafizur Rahman Hridoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activeGame = true
    var userAction = 1 //we use 1 for nought, 2 for cross
    var userState = [0, 0, 0, 0, 0, 0, 0, 0, 0] //0 for empty, 1- for nought, 2- for cross
    let winningCombination = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]] //winning combination inside array possition
    
    @IBOutlet weak var winningMessage: UILabel!
    
    @IBOutlet weak var playAgainText: UIButton!
    
    @IBAction func playAgainButton(_ sender: Any) {
        
         activeGame = true
         userAction = 1 //we use 1 for nought, 2 for cross
         userState = [0, 0, 0, 0, 0, 0, 0, 0, 0] //0 for empty, 1- for nought, 2- for cross
        
        for i in 1..<10             //making image disappear.
        {
            if let button = view.viewWithTag(i) as? UIButton
            {
                button.setImage(nil, for: [])
                
            }
        }
        
        winningMessage.isHidden = true
        playAgainText.isHidden = true
        
        winningMessage.center = CGPoint(x: winningMessage.center.x - 500, y: winningMessage.center.y)
        playAgainText.center = CGPoint(x: playAgainText.center.x - 500, y: playAgainText.center.y)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func trunIcon(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1     //we have to track the position of the user
        
        if userState[activePosition] == 0 && activeGame
        {
            userState[activePosition] = userAction //updating array of userstate with userAction
            
            if userAction == 1 {
                sender.setImage(UIImage(named: "nought.png"), for: []) //process of showing nought image when user tap on the board
                userAction = 2
            }
            else
            {
                sender.setImage(UIImage(named: "cross.png"), for: []) //process of showing cross image when user tap on the board
                userAction = 1
            }
            
            for combination in winningCombination
            {
                if userState[combination[0]] != 0 && userState[combination[0]] == userState[combination[1]] && userState[combination[1]] == userState[combination[2]]       //checking userstate result with winningCombination
                {
                    //We have a winner
                    
                    activeGame = false              //prevent the game putting input after the win
                    winningMessage.isHidden = false
                    playAgainText.isHidden = false
                    
                    if userState[combination[0]] == 1
                    {
                        winningMessage.text = "Nought Has Won"
                    }
                    else
                    {
                        winningMessage.text = "Cross Has Won"
                    }
                    
                    
                    UIView.animate(withDuration: 1, animations: {
                        
                        self.winningMessage.center = CGPoint(x: self.winningMessage.center.x + 500, y: self.winningMessage.center.y)
                        self.playAgainText.center = CGPoint(x: self.playAgainText.center.x + 500, y: self.playAgainText.center.y)
                    })
                    
                }
            }
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winningMessage.isHidden = true
        playAgainText.isHidden = true
        
        winningMessage.center = CGPoint(x: winningMessage.center.x - 500, y: winningMessage.center.y)
        playAgainText.center = CGPoint(x: playAgainText.center.x - 500, y: playAgainText.center.y)
        // Do any additional setup after loading the view.
    }


}

