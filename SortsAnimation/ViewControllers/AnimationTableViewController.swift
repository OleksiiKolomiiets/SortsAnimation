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
                case .result(let at, let to, let array):
                    tableView.beginUpdates()
                    unsortedArray = array
                    tableView.moveRow(at: IndexPath(row: at, section: numberOfSections), to: IndexPath(row: to, section: numberOfSections))
                    tableView.endUpdates()
                case .end:
                    print("end")
                    break
                }
                isStartToSort = false
            }
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




