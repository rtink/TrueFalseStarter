//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AVFoundation

class ViewController: UIViewController {
    
    let questionsPerRound = allGameQuestions.count
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
    var prevQuestionsArray: [Int] = []
   
    var audioPlayer: AVAudioPlayer!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    @IBOutlet weak var fourthAnswerButton: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playSound(soundFileName: "gameStartOver")
        // Start game
        nextRound()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayQuestion() {
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: allGameQuestions.count)
        
        // make sure that questions do not repeat
        while prevQuestionsArray.contains(indexOfSelectedQuestion) {
            indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: allGameQuestions.count)
        }
        
        // append with asked questions so they do not repeat
        prevQuestionsArray.append(indexOfSelectedQuestion)
        
        let triviaQuestions = allGameQuestions[indexOfSelectedQuestion]
        questionField.text = triviaQuestions.question
        playAgainButton.isHidden = true
        resultLabel.isHidden = true
        
        enableButtons()
        
        firstAnswerButton.setTitle(triviaQuestions.firstAnswer, for: .normal)
        secondAnswerButton.setTitle(triviaQuestions.secondAnswer, for: .normal)
        thirdAnswerButton.setTitle(triviaQuestions.thirdAnswer, for: .normal)
        fourthAnswerButton.setTitle(triviaQuestions.fourthAnswer, for: .normal)
        
        
    }
    
    func displayScore() {
        
        if correctQuestions == 13 {
            questionField.text = "1st Place! You scored \(correctQuestions) out of \(questionsPerRound)"
            questionField.textColor = UIColor.yellow
        } else if correctQuestions > 10{
            questionField.text = "2nd Place Place! You scored \(correctQuestions) out of \(questionsPerRound)"
            questionField.textColor = UIColor.darkGray
        } else {
            questionField.text = "3rd Place Place! You scored \(correctQuestions) out of \(questionsPerRound)"
            questionField.textColor = UIColor.brown
        }
        // Hide the answer buttons
        firstAnswerButton.isHidden = true
        secondAnswerButton.isHidden = true
        thirdAnswerButton.isHidden = true
        fourthAnswerButton.isHidden = true
        resultLabel.isHidden = true
        
        
        // Display play again button
        playAgainButton.isHidden = false

    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        //resultLabel.isHidden = true
        let currentQuestion = allGameQuestions[indexOfSelectedQuestion]
        let correctAnswer = currentQuestion.correctAnswer
        
        // check for correct answer, display appropriate message, sound & color
        if (sender === firstAnswerButton && correctAnswer == currentQuestion.firstAnswer) || (sender === secondAnswerButton && correctAnswer == currentQuestion.secondAnswer) || (sender === thirdAnswerButton && correctAnswer == currentQuestion.thirdAnswer) || (sender === fourthAnswerButton && correctAnswer == currentQuestion.fourthAnswer) {
            resultLabel.isHidden = false
            correctQuestions += 1
            resultLabel.text = "Correct!"
            resultLabel.textColor = UIColor.green
            playSound(soundFileName: "correctAnswer")
        } else {
            resultLabel.isHidden = false
            resultLabel.text = "Sorry. Correct answer is \(correctAnswer)."
            resultLabel.textColor = UIColor.orange
            playSound(soundFileName: "wrongAnswer")
        }
        
        disableButtons()
        loadNextRoundWithDelay(seconds: 2)
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            playSound(soundFileName: "gameStartOver")
            displayScore()
        } else {
            // Continue game
            displayQuestion()
            
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        firstAnswerButton.isHidden = false
        secondAnswerButton.isHidden = false
        thirdAnswerButton.isHidden = false
        fourthAnswerButton.isHidden = false
        resultLabel.isHidden = true
        
        questionField.textColor = UIColor.white
        questionsAsked = 0
        correctQuestions = 0
        prevQuestionsArray.removeAll()
        playSound(soundFileName: "gameStartOver")
        nextRound()
    }
    
    
    
    // MARK: Helper Methods
    
    func enableButtons() {
        firstAnswerButton.isUserInteractionEnabled = true
        secondAnswerButton.isUserInteractionEnabled = true
        thirdAnswerButton.isUserInteractionEnabled = true
        fourthAnswerButton.isUserInteractionEnabled = true
    }
    
    func disableButtons() {
        firstAnswerButton.isUserInteractionEnabled = false
        secondAnswerButton.isUserInteractionEnabled = false
        thirdAnswerButton.isUserInteractionEnabled = false
        fourthAnswerButton.isUserInteractionEnabled = false
    }
    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    func playSound(soundFileName: String) {
        
        let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: "wav")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        } catch {
            print(error)
        }
        audioPlayer.play()
    }
}

