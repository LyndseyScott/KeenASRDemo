//
//  ViewController.swift
//  KeenASRDemo
//
//  Created by Lyndsey Scott on 8/25/20.
//  Copyright © 2020 Lyndsey Scott LLC. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var asrSwitch: UISwitch!
    @IBOutlet weak var spokenTextLabel: UILabel!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var actionTable: UITableView!
    @IBOutlet weak var colorTable: UITableView!
    
    let actions = ["Blink", "Fade to", "Show"]
    let colors = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple"]
    let decodingGraphName = "CommandGraph"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func toggleListening(_ sender: UISwitch) {

    }
}

extension ViewController {
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
            spokenTextLabel.text = "\" \(spokenText) \""
            
            if let actionString = actions.filter({ (string) -> Bool in
                spokenText.lowercased().contains(string.lowercased())
            }).first, let colorString = colors.filter({ (string) -> Bool in
                spokenText.lowercased().contains(string.lowercased())
            }).first, let color = colorString.uiColor() {
                
                colorView.backgroundColor = .white
                if actionString.lowercased() == "blink" {
                    UIView.animate(withDuration: 0.15, delay: 0, options: [.curveEaseIn, .repeat, .autoreverse], animations: {
                        self.colorView.backgroundColor = color
                    })
                } else if actionString.lowercased() == "fade to" {
                    UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseIn], animations: {
                        self.colorView.backgroundColor = color
                    })
                } else if actionString.lowercased() == "show" {
                    self.colorView.backgroundColor = color
                }
            }
        }
    }
}

extension ViewController :  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == actionTable {
            return actions.count
        } else {
            return colors.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "\(UITableViewCell.self)")
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        if tableView == actionTable {
            cell.textLabel?.text = actions[indexPath.row]
        } else {
            cell.textLabel?.text = colors[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == actionTable {
            return "Actions"
        } else {
            return "Colors"
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
}
