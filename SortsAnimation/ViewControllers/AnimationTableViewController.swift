//
//  AnimationTableViewController.swift
//  SortsAnimation
//
//  Created by Oleksii Kolomiiets on 5/7/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class AnimationTableViewController: UITableViewController {

    var unsortedArray = [12, 8, 9, 23, 1]
    var sortModel: SortModelProtocol?
    var isStartToSort = false {
        didSet {
            if isStartToSort {
                guard let newArray = self.sortModel?.sort(unsortedArray) else { return }
                unsortedArray = newArray
                tableView.reloadData()
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


