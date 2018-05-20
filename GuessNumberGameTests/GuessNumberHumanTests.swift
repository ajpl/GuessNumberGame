//
//  GuessNumberHumanTests.swift
//  GuessNumberGameTests
//
//
//  2018
//

import XCTest
@testable import GuessNumberGame
var humanGuess : GuessNumberHumanClass!
var random : ProvideRandomNumber!

class GuessNumberHumanTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        random = ProvideRandomNumber()
        humanGuess = GuessNumberHumanClass(inputType: random)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        humanGuess = nil
        random = nil
        super.tearDown()
    }
    
    func testRandom() {
        random.setLimits(n1: humanGuess.getLowerLimit(), n2: humanGuess.getUpperLimit())
        repeat {
            humanGuess.getInputNum()
            
            if humanGuess.decisionLogic() {
                random.setLimits(n1: humanGuess.getCurrentGuessedNumber(), n2: humanGuess.getUpperLimit())
            }else{
                random.setLimits(n1: humanGuess.getLowerLimit(), n2: humanGuess.getCurrentGuessedNumber())
            }
        }while (humanGuess.isRunning())
        
        XCTAssertEqual(random.getLastRandom(), humanGuess.getRandom(), "Numbers do not match.")
    }
    
    func testRandomDiffLimits() {
        humanGuess.setLimits(n1: 1, n2: 1000)
        random.setLimits(n1: humanGuess.getLowerLimit(), n2: humanGuess.getUpperLimit())
        repeat {
            humanGuess.getInputNum()
            
            if humanGuess.decisionLogic() {
                random.setLimits(n1: humanGuess.getCurrentGuessedNumber(), n2: humanGuess.getUpperLimit())
            }else{
                random.setLimits(n1: humanGuess.getLowerLimit(), n2: humanGuess.getCurrentGuessedNumber())
            }
        }while (humanGuess.isRunning())
        
        XCTAssertEqual(random.getLastRandom(), humanGuess.getRandom(), "Numbers do not match when limits are changed.")
    }
    
    func testLowerBound() {
        random.setLimits(n1: humanGuess.getLowerLimit(), n2: humanGuess.getUpperLimit())
        humanGuess.setRandomNumber(n: humanGuess.getLowerLimit())
        repeat {
            humanGuess.getInputNum()
            
            if humanGuess.decisionLogic() {
                random.setLimits(n1: humanGuess.getCurrentGuessedNumber(), n2: humanGuess.getUpperLimit())
            }else{
                random.setLimits(n1: humanGuess.getLowerLimit(), n2: humanGuess.getCurrentGuessedNumber())
            }
        }while (humanGuess.isRunning())
        
        XCTAssertEqual(random.getLastRandom(), humanGuess.getRandom(), "Numbers do not match for the lower bound.")
    }
    
    func testUpperBound() {
        random.setLimits(n1: humanGuess.getLowerLimit(), n2: humanGuess.getUpperLimit())
        humanGuess.setRandomNumber(n: humanGuess.getUpperLimit())
        repeat {
            humanGuess.getInputNum()
            
            if humanGuess.decisionLogic() {
                random.setLimits(n1: humanGuess.getCurrentGuessedNumber(), n2: humanGuess.getUpperLimit())
            }else{
                random.setLimits(n1: humanGuess.getLowerLimit(), n2: humanGuess.getCurrentGuessedNumber())
            }
        }while (humanGuess.isRunning())
        
        XCTAssertEqual(random.getLastRandom(), humanGuess.getRandom(), "Numbers do not match for the upper bound.")
    }
    
    
}
