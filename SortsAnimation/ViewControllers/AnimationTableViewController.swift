//
//  AnimationTableViewController.swift
//  SortsAnimation
//
//  Created by Oleksii Kolomiiets on 5/7/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class AnimationTableViewController: UITableViewController {

    private let numberOfSections = 0
    var unsortedArray: [Int] {
        return sortModel!.array
    }
    var sortModel: SortModelProtocol?
    var element = 0
    var result: [(indexes: [Int], isSwap: Bool)] {
        return (sortModel?.result)!
    }
    var isSortedSuccess = false {
        didSet {
            successHighlight()
        }
    }
    var isStartToSort = false {
        didSet {
            if element < result.count {
                let indexes = self.result[element].indexes
                let isSwap = self.result[element].isSwap
                if isSwap {
                    tableView.beginUpdates()
                    UIView.animate(withDuration: 2.5) {
                        self.highlightCells(indexes, with: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), animate: true)
                    }
                    tableView.moveRow(at: IndexPath(row: indexes[0], section: self.numberOfSections), to: IndexPath(row: indexes[1], section: self.numberOfSections))
                    tableView.moveRow(at: IndexPath(row: indexes[1], section: self.numberOfSections), to: IndexPath(row: indexes[0], section: self.numberOfSections))
                    tableView.endUpdates()
                } else {
                    UIView.animate(withDuration: 2.5) { self.highlightCells(indexes, with: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), animate: true) }
                }
                element += 1
                isStartToSort = false
            } else {
                let indexes = getAllIndexes(unsortedArray)
                 UIView.animate(withDuration: 2.5) { self.highlightCells(indexes, with: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), animate: true) }
                isSortedSuccess = true
            }
        }
    }
        
    private func highlightCells(_ cellsColection: [Int], with color: UIColor, animate: Bool) {
        cellsColection.forEach { item in
            let cellFirst = tableView.cellForRow(at: IndexPath(row: item, section: self.numberOfSections))
            cellFirst?.backgroundColor = color
            if animate {
                cellFirst?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            }
        }
    }
    
    func getAllIndexes(_ array: [Int]) -> [Int] {
        var result = [Int]()
        for i in 0..<array.count {
            result.append(i)
        }
        return result
    }
    
    private func successHighlight() {
        for item in 0..<unsortedArray.count {
            let cell = tableView.cellForRow(at: IndexPath(row: item, section: self.numberOfSections))
            cell?.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return unsortedArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VisualCell", for: indexPath)
        cell.configure(with: unsortedArray[indexPath.row])
        return cell
    }

}

extension UITableViewCell {
    func configure(with value: Int) {
        let title = String(value)
        self.textLabel?.text = title
    }
}




