//
//  UserInput.swift
//  GuessNumberGame
//
//
//  2018
//

import Foundation

protocol UserInput {
    func getInput() -> String
}


class readInput: UserInput {
    func getInput() -> String {
        if let str = readLine() {
            return str
        }else{
            return ""
        }
    }
}

class ProvideRandomNumber: UserInput {
    var upperLimit = 0
    var lowerLimit = 0
    private var previousRandoms = [Int()]
    private func random(_ range:Range<Int>) -> Int
    {
        return range.lowerBound + Int(arc4random_uniform(UInt32(range.upperBound+1 - range.lowerBound)))
    }
    func setLimits(n1 :Int, n2: Int) {
        lowerLimit = n1
        upperLimit = n2
    }
    
    private func newNumber() -> Int {
        let randomNumber = random(lowerLimit..<upperLimit)
        if previousRandoms.contains(randomNumber) {
            return newNumber()
        }else{
            previousRandoms.append(randomNumber)
            return randomNumber
        }
    }
    
    func getInput() -> String {
        return String(newNumber())
    }
    
    func getLastRandom() -> Int {
        return previousRandoms.last!
    }
}

class ProvideAnswer: UserInput {
    private var answers : [String]
    private var count = 0
    init(answerArray : [String]) {
        answers = answerArray
    }
    func getInput() -> String {
        let actualCount = count
        count += 1
        return answers[actualCount]
    }
    func setAnswers(answerArray : [String]) -> () {
        answers = answerArray
    }
}
