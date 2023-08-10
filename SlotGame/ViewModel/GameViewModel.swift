//
//  GameViewModel.swift
//  SlotGame
//
//  Created by Berkay Sutlu on 9.08.2023.
//

import SwiftUI

class GameViewModel : ObservableObject {
    
    func randomStringFromArray(_ array: [String]) -> String {
        guard let randomElement = array.randomElement() else {
            return "No Strings"
        }
        return randomElement
    }

    func performThreeRandomSelections(stringsArray: [String]) -> String {
            let selectedString = randomStringFromArray(stringsArray)
            print("Selected: \(selectedString)")
        
            return selectedString
        
    }
    
    func rollArrayElements(array: [String], times: Int) -> [String] {
        var selectedStrings: [String] = []

        for _ in 1...times {
            let selectedString = array.randomElement() ?? ""
            selectedStrings.append(selectedString)
        }

        return selectedStrings
    }
}
