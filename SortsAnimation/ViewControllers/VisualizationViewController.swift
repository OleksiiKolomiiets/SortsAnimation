//
//  VisualizationViewController.swift
//  SortsAnimation
//
//  Created by Oleksii Kolomiiets on 5/7/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class VisualizationViewController: UIViewController {

    var sortModel: SortModelProtocol?
    var animationViewController: AnimationTableViewController?
    
    @IBAction func tappedNextButton(_ sender: UIButton) {
        animationViewController?.isStartToSort = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationViewController?.sortModel = sortModel
        self.navigationItem.title = sortModel?.title
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let embededVC = segue.destination as? AnimationTableViewController {
            self.animationViewController = embededVC
        }
    }

}
