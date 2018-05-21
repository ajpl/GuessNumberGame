//
//  GuessNumberComputerTests.swift
//  GuessNumberGameTests
//
//
//  2018
//

import XCTest
@testable import GuessNumberGame
var computerGuess : GuessNumberComputer!
var answerArray : ProvideAnswer!
class GuessNumberComputerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        answerArray = ProvideAnswer.init(answerArray: [""])
        computerGuess = GuessNumberComputer(inputType: answerArray)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        computerGuess = nil
        super.tearDown()
    }
    
    func testForLowerBound() {
        // Test that should result in the number 1 being the user's secret number
        answerArray.setAnswers(answerArray: ["-","-","-","-","-","="])
        computerGuess.setLimits(n1: 1, n2: 100)
        computerGuess.start()
        XCTAssertEqual(computerGuess.getArray()[0], computerGuess.getCurrentGuess(), "The result should be \(computerGuess.getArray()[0])")
        XCTAssertLessThanOrEqual(computerGuess.getAttempt(), computerGuess.getMaxAttempt(), "Number of attempts higher than expected")
    }
    
    func testForMidBound() {
        // Test that should result in the number 50 being the user's secret number
        answerArray.setAnswers(answerArray: ["="])
        computerGuess.setLimits(n1: 1, n2: 100)
        computerGuess.start()
        XCTAssertEqual(computerGuess.getArray()[(computerGuess.getArray().count-1)/2], computerGuess.getCurrentGuess(), "The result should be \(computerGuess.getArray()[(computerGuess.getArray().count-1)/2])")
        XCTAssertEqual(computerGuess.getAttempt(), 1, "Number of attempts higher than expected")
    }
    
    
    func testForUpperBound() {
        // Test that should result in the number 100 being the user's secret number
        answerArray.setAnswers(answerArray: ["+","+","+","+","+","+","="])
        computerGuess.setLimits(n1: 1, n2: 100)
        computerGuess.start()
        XCTAssertEqual(computerGuess.getArray()[computerGuess.getArray().count-1], computerGuess.getCurrentGuess(), "The result should be \(computerGuess.getArray()[computerGuess.getArray().count-1])")
        XCTAssertLessThanOrEqual(computerGuess.getAttempt(), computerGuess.getMaxAttempt(), "Number of attempts higher than expected")
    }
    
    func testDiffLimit() {
        // Test that should result in the number 7521 being the user's secret number. This time the boundaries have been moved to 1 and 10000
        answerArray.setAnswers(answerArray: ["+","+","-","-","-","-","-","-","+","-","-","="])
        computerGuess.setLimits(n1: 1, n2: 10000)
        computerGuess.start()
        XCTAssertEqual(computerGuess.getArray()[computerGuess.getArray()[7519]], computerGuess.getCurrentGuess(), "The result should be \(computerGuess.getArray()[computerGuess.getArray()[7519]])")
        XCTAssertLessThanOrEqual(computerGuess.getAttempt(), computerGuess.getMaxAttempt(), "Number of attempts higher than expected")
    }
    
    
}
