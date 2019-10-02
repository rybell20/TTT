//
//  scoreSceenController.swift
//  TicTacToe
//
//  Created by Bell, Ryan J. on 11/13/17.
//  Copyright © 2017 Bell, Ryan J. All rights reserved.
//

import UIKit

class scoreScreenController: UIViewController {
    
    @IBOutlet weak var comp: UILabel!
    
    @IBOutlet weak var human: UILabel!
    
    @IBOutlet weak var tie: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        comp.text = "\(GlobalVariables.sharedManager.comp_wins)"
        human.text = "\(GlobalVariables.sharedManager.human_wins)"
        tie.text = "\(GlobalVariables.sharedManager.num_ties)"

    }
    
        override func viewWillAppear(_ animated: Bool) {
            comp.text = "\(GlobalVariables.sharedManager.comp_wins)"
            human.text = "\(GlobalVariables.sharedManager.human_wins)"
            tie.text = "\(GlobalVariables.sharedManager.num_ties)"
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
