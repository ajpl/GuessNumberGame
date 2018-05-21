//
//  GuessNumberComputer.swift
//  GuessNumberGame
//
//
//  2018
//

import Foundation

class GuessNumberComputer: GuessNumberGame {
    enum answer : String {
        case yes = "="
        case bigger = "+"
        case smaller = "-"
    }
    private var currentGuess = Int()
    private var lowerIndex = Int()
    private var upperIndex = Int()
    private var intArray = [Int()]
    private var currentIndex = Int()
    private var isPlaying = true
    private var input : UserInput
    
    init(inputType : UserInput) {
        input = inputType
        super.init()
    }
    
    override func start() {
        firstRun()
        super.start()
    }
    
    override func update() {
        updateCurrentIndex()
        currentGuess = intArray[currentIndex]
        getInputStr()
    }
    
    private func getInputStr() -> () {
        print("\(ConsoleMessages.shared.isNumberMsg(n: currentGuess)) (\(answer.yes.rawValue)/\(answer.smaller.rawValue)/\(answer.bigger.rawValue))")
        let input = self.input.getInput()
        switch input {
        case answer.yes.rawValue:
            print(ConsoleMessages.shared.computerWinsMsg(n: currentGuess))
            print(ConsoleMessages.shared.attemptsMsg(n: getAttempt()))
            print("")
            setRunningState(state: false)
        case answer.bigger.rawValue:
            updateLowerIndex()
            addAttempt()
        case answer.smaller.rawValue:
            updateUpperIndex()
            addAttempt()
        default:
            print("\(ConsoleMessages.shared.failedInputMsg()) (\(answer.yes.rawValue)/\(answer.smaller.rawValue)/\(answer.bigger.rawValue))")
        }
        outOfAttempts()
    }
    
    private func firstRun() {
        if getAttempt() == 0 {
            intArray = getArray()
            lowerIndex = 0
            upperIndex = intArray.count - 1
            addAttempt()
        }
    }
    
    private func updateLowerIndex() {
        lowerIndex = currentIndex + 1
    }
    private func updateUpperIndex() {
        upperIndex = currentIndex - 1
    }
    private func updateCurrentIndex() {
        currentIndex = (upperIndex + lowerIndex) / 2
    }
    func getCurrentGuess() -> Int {
        return currentGuess
    }
    private func outOfAttempts() {
        if getAttempt() > getMaxAttempt() {
            print(ConsoleMessages.shared.maxAttemptMsg())
            setRunningState(state: false)
        }
    }
    
}
