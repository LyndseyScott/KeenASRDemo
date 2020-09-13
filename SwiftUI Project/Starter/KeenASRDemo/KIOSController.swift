//
//  KIOSController.swift
//  KeenASRDemo
//
//  Created by Lyndsey Scott on 8/24/20.
//  Copyright © 2020 Lyndsey Scott LLC. All rights reserved.
//

import AVFoundation
import Combine
import SwiftUI

// KIOSController needs to be a ObservableObject in order
// to be accessible by SwiftUI
class KIOSController : NSObject, ObservableObject {
    
    // didChange will let the SwiftUI know that some changes have happened in this object
    // and we need to rebuild all the views related to that object
    @Published var spokenText: String = ""
    @Published var action: Animation?
    @Published var color: UIColor?
    var didChange = PassthroughSubject<Void, Never>()
    
    let actions = ["Blink", "Fade to", "Show"]
    let colors = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple"]
    let decodingGraphName = "CommandGraph"
    var listeningOn = false
    
    override init() {
        super.init()
    }
    
    func toggleListening(_ isOn: Bool) {
        
    }
}

extension KIOSController {
    func allCommands() -> [String] {
        var commands: [String] = []
        for action in actions {
            for color in colors {
                commands.append(action + " " + color)
            }
        }
        return commands
    }
    
    func processSpokenText(_ spokenText: String) {
        if !spokenText.isEmpty {
            self.spokenText = spokenText
            if let actionString = actions.filter({ (string) -> Bool in
                spokenText.lowercased().contains(string.lowercased())
            }).first, let colorString = colors.filter({ (string) -> Bool in
                spokenText.lowercased().contains(string.lowercased())
            }).first {
                // Clear out UI
                action = nil
                color = nil
                didChange.send(())
                // Update UI with current action and color
                delay(0.25) {
                    self.action = actionString.animation()
                    self.color = colorString.uiColor()
                    self.didChange.send(())
                }
            } else {
                didChange.send(())
            }
        }
    }
}

extension String {
    func uiColor() -> UIColor? {
        switch self.lowercased() {
        case "red":
            return UIColor.red
        case "orange":
            return UIColor.orange
        case "yellow":
            return UIColor.yellow
        case "green":
            return UIColor.green
        case "blue":
            return UIColor.blue
        case "purple":
            return UIColor.purple
        default:
            return nil
        }
    }
    
    func animation() -> Animation? {
        switch self.lowercased() {
        case "blink":
            return Animation
                .easeIn(duration: 0.15)
                .repeatForever(autoreverses: true)
        case "fade to":
            return Animation
                .easeIn(duration: 1.0)
        case "show":
            return Animation
                .easeIn(duration: 0)
        default:
            return nil
        }
    }
}

func delay(_ delay: Double, closure: @escaping ()->()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}
