//
//  GuessNumberHuman.swift
//  GuessNumberGame
//
//
//  2018
//

import Foundation

class GuessNumberHumanClass: GuessNumberGameClass {
    private var randomNumber = 0
    private var guessedNumber = Int()
    private var isBigger = true
    private var input : UserInput
    
    init(inputType : UserInput) {
        input = inputType
        super.init()
        createRandomNumber()
    }
    
    
    func getInputNum() -> () {
        print(ConsoleMessages.shared.pickNumberMsg(n1: getLowerLimit(), n2: getUpperLimit()))
        if let num = Int(input.getInput()) {
            if (num >= getLowerLimit() && num <= getUpperLimit()) {
                addAttempt()
                guessedNumber = num
                return
            }else {
                print(ConsoleMessages.shared.notInLimits())
            }
        }else{
            print(ConsoleMessages.shared.notIntMsg())
        }
        getInputNum()
    }
    
    override func setLimits(n1: Int, n2: Int) {
        super.setLimits(n1: n1, n2: n2)
        createRandomNumber()
    }
    
    override func update() -> () {
        getInputNum()
        _ = decisionLogic()
    }
    
    func decisionLogic() -> Bool {
        if guessedNumber == randomNumber {
            print(ConsoleMessages.shared.humanWinsMsg(n: guessedNumber))
            print(ConsoleMessages.shared.attemptsMsg(n: getAttempt()))
            print("")
            setRunningState(state: false)
        }else if guessedNumber > randomNumber {
            print(ConsoleMessages.shared.numberSmallerMsg())
            isBigger = false
        }else if guessedNumber < randomNumber {
            print(ConsoleMessages.shared.numberBiggerMsg())
            isBigger = true
        }
        return isBigger
    }
    
    private func createRandomNumber() -> () {
        randomNumber = Int(arc4random_uniform(UInt32(getUpperLimit())))
    }
    
    func setRandomNumber(n: Int) -> () {
        randomNumber = n
    }
    
    func getBigger() -> Bool {
        return isBigger
    }
    func getCurrentGuessedNumber() -> Int {
        return guessedNumber
    }
    func getRandom() -> Int {
        return randomNumber
    }
}
