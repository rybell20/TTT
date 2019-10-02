//
//  GlobalVariables.swift
//  TicTacToe
//
//  Created by Bell, Ryan J. on 11/13/17.
//  Copyright © 2017 Bell, Ryan J. All rights reserved.
//

class GlobalVariables {
    
    var num_ties: Int = 0
    var human_wins: Int = 0
    var comp_wins: Int = 0
    
    class var sharedManager: GlobalVariables {
        struct Static {
            static let instance = GlobalVariables()
        }
        return Static.instance
    }
}
