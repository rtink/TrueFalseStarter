//
//  Sound.swift
//  TrueFalseStarter
//
//  Created by Rhonda Tinkham on 11/12/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit
import AudioToolbox

var startGameOverSound : SystemSoundID = 0
var correctAnswerSound : SystemSoundID = 0
var wrongAnswerSound : SystemSoundID = 0
var countdownSound : SystemSoundID = 0

// Create sound ID and path
func loadStartGameOverSound() {
    let pathToSoundFile = Bundle.main.path(forResource: "gameStartOver", ofType: "wav")
    let soundURL = URL(fileURLWithPath: pathToSoundFile!)
    AudioServicesCreateSystemSoundID(soundURL as CFURL, &startGameOverSound)
}

func loadCorrectAnswerSound() {
    let pathToSoundFile = Bundle.main.path(forResource: "correctAnswer", ofType: "wav")
    let soundURL = URL(fileURLWithPath: pathToSoundFile!)
    AudioServicesCreateSystemSoundID(soundURL as CFURL, &correctAnswerSound)
}

func loadWrongAnswerSound() {
    let pathToSoundFile = Bundle.main.path(forResource: "wrongAnswer", ofType: "wav")
    let soundURL = URL(fileURLWithPath: pathToSoundFile!)
    AudioServicesCreateSystemSoundID(soundURL as CFURL, &wrongAnswerSound)
}

func loadCountDownSound() {
    let pathToSoundFile = Bundle.main.path(forResource: "timer", ofType: "wav")
    let soundURL = URL(fileURLWithPath: pathToSoundFile!)
    AudioServicesCreateSystemSoundID(soundURL as CFURL, &countdownSound)
}


// Play sounds
func playStartGameOverSound() {
    AudioServicesPlaySystemSound(startGameOverSound)
}

func playCorrectAnswerSound() {
    AudioServicesPlaySystemSound(correctAnswerSound)
}

func playWrongAnswerSound() {
    AudioServicesPlaySystemSound(wrongAnswerSound)
}

func playCountDownSound() {
    AudioServicesPlaySystemSound(countdownSound)
}
