//
//  main.swift
//  GuessNumberGame
//
//
//  2018
//

import Foundation

print(ConsoleMessages.shared.welcomeMsg() + "\n")

repeat {
    print(ConsoleMessages.shared.menuMsg())
    print("1. \(ConsoleMessages.shared.humanGuessesMsg())")
    print("2. \(ConsoleMessages.shared.computerGuessesMsg())")
    print("3. \(ConsoleMessages.shared.exitMsg())")
    if let choice = readLine() {
        let read = readInput()
        switch choice{
        case "1":
            let gnh = GuessNumberHumanClass(inputType: read)
            gnh.start()
        case "2":
            let gnc = GuessNumberComputerClass(inputType: read)
            gnc.start()
        case "3":
            print(ConsoleMessages.shared.goodbyeMsg())
            abort()
        default:
            break
        }
    }
}while (true)
