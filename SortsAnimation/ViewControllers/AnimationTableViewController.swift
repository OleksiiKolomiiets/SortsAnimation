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
    var fakeB = BubbleModel()
    var fakeS = SelectionModel()
    var fakeI = InsertModel()
    var isStartToSort = false {
        didSet {
            if isStartToSort {
//                guard let newArray = self.sortModel?.sort(unsortedArray) else { return }
//                unsortedArray = newArray
                let indexesForSwap = fakeB.fakeSort(unsortedArray)
                print(unsortedArray)
                switch indexesForSwap {
                case .swap(let at, let to, let array, let highlight):
                    tableView.beginUpdates()
                    unsortedArray = array
                    UIView.animate(withDuration: 0.5) {
                        self.highlightCells(highlight)
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.highlightCells([(first: at, second: to)])
                        self.tableView.moveRow(at: IndexPath(row: at, section: self.numberOfSections), to: IndexPath(row: to, section: self.numberOfSections))
                    }
                    tableView.endUpdates()
                case .end(let highlight):
                    self.highlightCells(highlight)
                    break
                }
                isStartToSort = false
            }
        }
    }
    
    private func highlightCells(_ cellsColection: [(first: Int, second: Int)]) {
        cellsColection.forEach { (at, to) in
            let cellFirst = tableView.cellForRow(at: IndexPath(row: at, section: self.numberOfSections))
            let cellSecond = tableView.cellForRow(at: IndexPath(row: to, section: self.numberOfSections))
            cellFirst?.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
            cellSecond?.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
            
            cellFirst?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            cellSecond?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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




