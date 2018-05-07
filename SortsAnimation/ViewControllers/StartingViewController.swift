//
//  ViewController.swift
//  SortsAnimation
//
//  Created by Oleksii Kolomiiets on 5/7/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class StartingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func tappedTypeOfSort(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let targetVC = storyboard.instantiateViewController(withIdentifier: "VisualizationId") as? VisualizationViewController,
            let label = sender.titleLabel,
            let title = label.text?.lowercased(),
            let sortType = SortType(rawValue: title) else { return }
        targetVC.sortModel = sortType.model
        self.navigationController?.pushViewController(targetVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
