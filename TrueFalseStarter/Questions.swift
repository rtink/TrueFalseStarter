//
//  Question.swift
//  TrueFalseStarter
//
//  Created by Rhonda Tinkham on 11/12/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class Question {
    
    let question : String
    let firstAnswer : String
    let secondAnswer : String
    let thirdAnswer : String
    let fourthAnswer : String
    let correctAnswer : String
    
    init(question: String, firstAnswer: String, secondAnswer: String, thirdAnswer: String, fourthAnswer: String, correctAnswer: String) {
        self.question = question
        self.firstAnswer = firstAnswer
        self.secondAnswer = secondAnswer
        self.thirdAnswer = thirdAnswer
        self.fourthAnswer = fourthAnswer
        self.correctAnswer = correctAnswer
    }
}
// Trivia questions with answer choices and correct answer - 4 Option questions
let gameQuestion01 = Question(question: "What is the name of the actress who plays Hermione Granger in Harry Potter?", firstAnswer: "Emma Watson", secondAnswer: "Patricia Arquette", thirdAnswer: "Alexandra Daddario", fourthAnswer: "Gal Gadot", correctAnswer: "Emma Watson")

let gameQuestion02 = Question(question: "Which house at Howarts was Harry in?", firstAnswer: "Slytherin", secondAnswer: "Gryffindor", thirdAnswer: "Ravenclaw", fourthAnswer: "Hufflepuff", correctAnswer: "Gryffindor")

let gameQuestion03 = Question(question: "In what year was the first Harry Potter movie released?", firstAnswer: "2000", secondAnswer: "2002", thirdAnswer: "2001", fourthAnswer: "1999", correctAnswer: "2001")

let gameQuestion04 = Question(question: "What is Donald Duck's girlfriend's name?", firstAnswer: "Georgia", secondAnswer: "Francine", thirdAnswer: "Daisy", fourthAnswer: "Lucy", correctAnswer: "Daisy")

let gameQuestion05 = Question(question: "What is the most abundant metal in the earth's crust?", firstAnswer: "Aluminum", secondAnswer: "Iron", thirdAnswer: "Magnesium", fourthAnswer: "Radium", correctAnswer: "Aluminum")

let gameQuestion06 = Question(question: "What is the second most abundant element in the earth's atmosphere?", firstAnswer: "Nitrogen", secondAnswer: "Carbon dioxide", thirdAnswer: "Dust", fourthAnswer: "Oxygen", correctAnswer: "Oxygen")

let gameQuestion07 = Question(question: "What is the world's largest ocean?", firstAnswer: "Pacific", secondAnswer: "Atlantic", thirdAnswer: "Indian", fourthAnswer: "Arctic", correctAnswer: "Pacific")

let gameQuestion08 = Question(question: "This was the only US President to serve more than two consecutive terms?", firstAnswer: "Franklin D Roosevelt", secondAnswer: "George Washington", thirdAnswer: "Woodrow Wilson", fourthAnswer: "Andrew Jackson", correctAnswer: "Franklin D Roosevelt")

let gameQuestion09 = Question(question: "Which of the following countries has the most residents?", firstAnswer: "Nigeria", secondAnswer: "Russia", thirdAnswer: "Iran", fourthAnswer: "Vietnam", correctAnswer: "Nigeria")

let gameQuestion10 = Question(question: "In what year was the United Nations founded?", firstAnswer: "1918", secondAnswer: "1919", thirdAnswer: "1945", fourthAnswer: "1954", correctAnswer: "1945")

let gameQuestion11 = Question(question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?", firstAnswer: "Paris", secondAnswer: "Washington DC", thirdAnswer: "New York City", fourthAnswer: "Boston", correctAnswer: "New York City")

let gameQuestion12 = Question(question: "Which nation produces the most oil?", firstAnswer: "Iran", secondAnswer: "Iraq", thirdAnswer: "Brazil", fourthAnswer: "Canada", correctAnswer: "Canada")

let gameQuestion13 = Question(question: "Which country has most recently won consecutive World Cups in Soccer?", firstAnswer: "Italy", secondAnswer: "Brazil", thirdAnswer: "Argentina", fourthAnswer: "Spain", correctAnswer: "Brazil")



let allGameQuestions = [
    gameQuestion01,
    gameQuestion02,
    gameQuestion03,
    gameQuestion04,
    gameQuestion05,
    gameQuestion06,
    gameQuestion07,
    gameQuestion08,
    gameQuestion09,
    gameQuestion10,
    gameQuestion11,
    gameQuestion12,
    gameQuestion13
]


