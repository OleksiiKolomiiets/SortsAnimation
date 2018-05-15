//
//  ViewController.swift
//  SortsAnimation
//
//  Created by Oleksii Kolomiiets on 5/7/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class StartingViewController: UIViewController {
    
    
    @IBOutlet weak var firstSelect: UIButton!
    @IBOutlet weak var secondSelect: UIButton!
    @IBOutlet weak var thirdSelect: UIButton!
    var selectedCountRandomArray: typeOfCountInRandomArray = .byDefault
    
    @IBAction func tappedTypeOfSort(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let targetVC = storyboard.instantiateViewController(withIdentifier: "VisualizationId") as? VisualizationViewController,
            let label = sender.titleLabel,
            let title = label.text?.lowercased(),
            let sortType = SortType(rawValue: title) else { return }
        let randomArray = RandomArrayMaker(capasity: selectedCountRandomArray.count)
        targetVC.sortModel = sortType.model
        targetVC.sortModel?.array = randomArray.array
        self.navigationController?.pushViewController(targetVC, animated: true)
    }
    
    @IBAction func selectedNumberOfElementsInRandomArray(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text, let value = Int(title) else { return }
        selectedCountRandomArray = .costom(value)
        switch sender.titleLabel?.text {
        case "5":
            firstSelect.backgroundColor = #colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 0.6022335123)
            
            secondSelect.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
            thirdSelect.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        case "10":
            firstSelect.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
            secondSelect.backgroundColor = #colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 0.6022335123)
            thirdSelect.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        case "15":
            firstSelect.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
            secondSelect.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
            thirdSelect.backgroundColor = #colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 0.6022335123)
        default:
            print("Default sender")
        }
    }
}

enum typeOfCountInRandomArray {
    case byDefault
    case costom(Int)
    
    var count: Int {
        switch self {
        case .byDefault:
            return 3
        case .costom(let count):
            return count
        }
    }
}

