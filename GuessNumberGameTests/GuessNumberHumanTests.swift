//
//  GuessNumberHumanTests.swift
//  GuessNumberGameTests
//
//
//  2018
//

import XCTest
@testable import GuessNumberGame
var humanGuess : GuessNumberHuman!
var random : ProvideRandomNumber!

class GuessNumberHumanTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        random = ProvideRandomNumber()
        humanGuess = GuessNumberHuman(inputType: random)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        humanGuess = nil
        random = nil
        super.tearDown()
    }
    
    func testLowerBound() {
        // Test for the case when the random number is the lower limit
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
        // Test for the case when the random number is the upper limit
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
    
    func testRandom() {
        // Test for the case when the limits are 1 to 100, the default
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
        // Test for the case when the limits are 1 to 1000, different to the default
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
    
}
