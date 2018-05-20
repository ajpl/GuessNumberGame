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
