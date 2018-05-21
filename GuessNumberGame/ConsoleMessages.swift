//
//  ConsoleMessages.swift
//  GuessNumberGame
//
// All of the app's messages can be easily
// seen in one place and corrected or translated
// if/when there is need. Also useful for localization
//
//  2018
//

import Foundation

final class ConsoleMessages {
    
    static let shared = ConsoleMessages()
    
    private init() {
        
    }
    
    func welcomeMsg() -> String{
        return "Welcome to the game!"
    }
    
    func menuMsg() -> String{
        return "Choose an option to begin..."
    }
    
    func humanGuessesMsg() -> String {
        return "Guess a number"
    }
    
    func computerGuessesMsg() -> String {
        return "Make the computer guess a number"
    }
    
    func exitMsg() -> String {
        return "Exit"
    }
    
    func goodbyeMsg() -> String {
        return "Bye!"
    }
    
    func pickNumberMsg(n1: Int, n2: Int) -> String {
        return "Please pick a number between \(n1) and \(n2)"
    }
    
    func notIntMsg() -> String {
        return "The input was not an integer"
    }
    
    func notInLimits() -> String {
        return "The input was not within the limits"
    }
    
    func humanWinsMsg(n: Int) -> String {
        return "You win, \(n) is my number!"
    }
    
    func numberSmallerMsg() -> String {
        return "My number is smaller"
    }
    
    func numberBiggerMsg() -> String {
        return "My number is bigger"
    }
    
    func isNumberMsg(n: Int) -> String {
        return "Is your number \(n)?"
    }
    
    func computerWinsMsg(n: Int) -> String {
        return "I win, your number is \(n)"
    }
    
    func attemptsMsg(n: Int) -> String {
        return "It took \(n) attempt(s)"
    }
    
    func computerRetryMsg() -> String {
        return "mmm... let's try again \nIs it bigger or smaller?"
    }
    
    func failedInputMsg() -> String {
        return "Please use"
    }
    
    func maxAttemptMsg() -> String {
        return "You must have answered a question wrong because I've\nexceeded the max attempts number. Play Again.\n"
    }
    
    func sanityCheckMsg(n1: Int, n2: Int) -> String {
        return "Lower limit \(n1) is bigger than upper limit \(n2) \nEnter new lower limit"
    }

}
