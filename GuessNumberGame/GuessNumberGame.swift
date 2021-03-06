//
//  GuessNumberGame.swift
//  GuessNumberGame
//
// Abstract class
//
//  2018
//


import Foundation

class GuessNumberGame {
    private var lowerLimit = Int()
    private var upperLimit = Int()
    private var attempts = 0
    private var maxAttempt = 0
    private var intArray = [Int()]
    private var running : Bool
    
    init() {
        lowerLimit = 1
        upperLimit = 100
        running = true
        calcMaxAttempt()
    }
    
    func start () -> () {
        while (running) {
            update()
        }
    }
    
    func update() {
        fatalError("Must implement in subclass")
    }
    
    func setRunningState(state: Bool) {
        running = state
    }
    
    func addAttempt() -> () {
        attempts += 1
    }
    func getAttempt() -> Int {
        return attempts
    }
    func getMaxAttempt() -> Int {
        return maxAttempt
    }
    private func calcMaxAttempt() {
        sanityCheck()
        createArray()
        //formula from the max number of attempts required
        //by binary search to find the number according to the array's size
        maxAttempt = Int(log2(Double(intArray.count-1)).rounded(.awayFromZero))
    }
    func createArray() -> () {
        intArray = Array(lowerLimit...upperLimit)
    }
    func getArray() -> [Int] {
        return intArray
    }
    func isRunning() -> Bool {
        return running
    }
    private func setUpperLimit(n : Int) -> () {
        upperLimit = n
        calcMaxAttempt()
    }
    
    private func setLowerLimit(n : Int) -> () {
        lowerLimit = n
        calcMaxAttempt()
    }
    func setLimits(n1 : Int, n2 : Int) -> () {
        lowerLimit = n1
        upperLimit = n2
        calcMaxAttempt()
    }
    func getUpperLimit() -> (Int) {
        return upperLimit
    }
    
    func getLowerLimit() -> (Int) {
        return lowerLimit
    }
    
    func sanityCheck() {
        while lowerLimit > upperLimit {
            print(ConsoleMessages.shared.sanityCheckMsg(n1: lowerLimit, n2: upperLimit))
            if let lower = Int(readLine()!) {
                setLowerLimit(n: lower)
            }
        }
    }
    
}
