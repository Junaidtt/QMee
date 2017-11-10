//
//  GameViewController.swift
//  QMee
//
//  Created by Bespokino on 9/22/2560 BE.
//  Copyright © 2560 Bespokino. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    
    var game:QMeeGame = QMeeGame()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pointLabel.text = "__"
        
        let starterImage = UIImage(named: "2")
        
        questionImageView.image = starterImage
        
        questionLabel.text = "Tap on true button to start new game!"
        
       // pointLabel.text = "\(game.point)"
        
        falseButton.isEnabled = false
        
        
    }
    
    @IBAction func trueButtonDidTap(_ sender: Any) {
        
        if pointLabel.text == "__" {
            
            game.point = 0
            falseButton.isEnabled = true
        }else{
            
            game.point += 1
            
        }
        
        
        updateUI()
        
        
    }
    
    
    
    @IBAction func falseButtonDidTap(_ sender: Any) {
    
        if pointLabel.text == "0" {
            
            falseButton.isEnabled = true
        }else{
            game.point -= 1
             updateUI()
        }
        
        
       
        
       
    }
    
    func updateUI()  {
        
        let nextQuestion = game.getNextQuestion()
        
        let questionImage = game.getQuestionImageName()
        
        let image = UIImage(named: questionImage)
        
        questionImageView.image = image
        
        questionLabel.text = nextQuestion
        
        pointLabel.text = String(game.point)

        
    }
    
    
    
    
    
}
