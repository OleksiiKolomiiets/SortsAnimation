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
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let embededVC = segue.destination as? AnimationTableViewController {
            self.animationViewController = embededVC
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
