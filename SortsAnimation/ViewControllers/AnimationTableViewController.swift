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
    var unsortedArray = [12, 8, 9, 23, 1]
    var sortModel: SortModelProtocol?
    var itterationStep = 0
    var isStartToSort = false {
        didSet {
            if isStartToSort {
                guard let indexesForSwap = self.sortModel?.fakeSort(self.unsortedArray, itterationStep: self.itterationStep) else { return }
                switch indexesForSwap {
                case .swap(let at, let to, let array):
                    itterationStep =  (at + 1 < unsortedArray.count - 1) ? at + 1 : 0
                    unsortedArray = array
                    tableView.beginUpdates()
                    UIView.animate(withDuration: 1.5) { self.highlightCells([(first: at, second: to)], with: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), animate: true) }
                    tableView.moveRow(at: IndexPath(row: at, section: self.numberOfSections), to: IndexPath(row: to, section: self.numberOfSections))
                    tableView.endUpdates()
                case .end(let highlight):
                    UIView.animate(withDuration: 1.5) { self.highlightCells(highlight, with: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), animate: false) }
                    break
                case .highlight(let first, let second, let itterationStep):
                    self.itterationStep = (itterationStep < unsortedArray.count - 1) ? itterationStep : 0
                    UIView.animate(withDuration: 1.5) { self.highlightCells([(first: first, second: second)], with: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), animate: true) }
                }
                isStartToSort = false
            }
        }
    }
        
    private func highlightCells(_ cellsColection: [(first: Int, second: Int)], with color: UIColor, animate: Bool) {
        cellsColection.forEach { (at, to) in
            let cellFirst = tableView.cellForRow(at: IndexPath(row: at, section: self.numberOfSections))
            let cellSecond = tableView.cellForRow(at: IndexPath(row: to, section: self.numberOfSections))
            cellFirst?.backgroundColor = color
            cellSecond?.backgroundColor = color
            if animate {
                cellFirst?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
                cellSecond?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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




