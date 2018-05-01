//
//  Game.swift
//  QuizzMvc
//
//  Created by Benaata on 26/04/2018.
//  Copyright © 2018 RabiiBenaata. All rights reserved.
//

import Foundation

class Game {
    var score = 0
    var state: State = .ongoing

    enum State {
        case ongoing, over
    }

    private var questions = [Question]()
    var currentIndex = 0

    var currentQuestion: Question {
        return questions[currentIndex]
    }

    func refresh() {
        score = 0
        currentIndex = 0
        state = .over

        QuestionManager.shared.get { (questions) in
            self.questions = questions
            self.state = .ongoing
            let name = Notification.Name(rawValue: "QuestionsLoaded")
            let notification = Notification(name: name)
            NotificationCenter.default.post(notification)
        }
    }

    func getQuestions(){
        QuestionManager.shared.get { (questions) in
        self.questions = questions
            print(self.questions)
        }
    }

    func answerCurrentQuestion(with answer: Bool) {
        if (currentQuestion.isCorrect && answer) || (!currentQuestion.isCorrect && !answer) {
            score += 1
        }
        goToNextQuestion()
    }

    private func goToNextQuestion() {
        if currentIndex < questions.count - 1 {
            currentIndex += 1
        } else {
            finishGame()
        }
    }

    private func finishGame() {
        state = .over
    }
}
