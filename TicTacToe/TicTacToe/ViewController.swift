//
//  ViewController.swift
//  TicTacToe
//
//  Created by Bell, Ryan J. on 10/2/17.
//  Copyright © 2017 Bell, Ryan J. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var difficulty = 2

    @IBOutlet weak var s1: UIImageView!
    @IBOutlet weak var s2: UIImageView!
    @IBOutlet weak var s3: UIImageView!
    @IBOutlet weak var s4: UIImageView!
    @IBOutlet weak var s5: UIImageView!
    @IBOutlet weak var s6: UIImageView!
    @IBOutlet weak var s7: UIImageView!
    @IBOutlet weak var s8: UIImageView!
    @IBOutlet weak var s9: UIImageView!
    @IBOutlet weak var whoseTurn: UILabel!
//    @IBOutlet weak var comp_wins: UILabel!
//    @IBOutlet weak var human_wins: UILabel!
//    @IBOutlet weak var num_ties: UILabel!
    @IBOutlet weak var mode: UILabel!
    
    
    @IBAction func Settings(_ sender: UIButton) {
        let alert = UIAlertController(title: "Game Settings", message: "Select the Difficulty Level", preferredStyle: .actionSheet)
       present(alert, animated: true, completion: nil)
        
        let beginner = UIAlertAction(title: "Beginner", style: .default) { (action) in print("Difficulty set to Beginner")
            self.difficulty = 2
            self.reset((Any).self)
            self.mode.text = "Difficulty: Beginner"
        }
        let medium = UIAlertAction(title: "Medium", style: .default) { (action) in
            print("Difficuty set to Medium")
            self.difficulty = 1
            self.reset((Any).self)
            self.mode.text = "Difficulty: Medium"
        }
        let hard = UIAlertAction(title: "Hard", style: .default) { (action) in
            print("Difficulty set to Hard")
            self.difficulty = 0
            self.reset((Any).self)
            self.mode.text = "Difficulty: HARD"
        }
        alert.addAction(beginner)
        alert.addAction(medium)
        alert.addAction(hard)
    }
    
    
    
    
    //scoreboard counters
    var computer = 0
    var human = 0
    var tie = 0
    
    var mBoardArray: [UIImageView] = []
    
    var HUMAN_PLAYER = "X"
    var COMPUTER_PLAYER = "O"
    var mBoard: [String] = ["0","1","2","3","4","5","6","7","8"]
    let BOARD_SIZE = 9
    var turn = "X"
    
    var win = 0
    var move = -1
    
    //Audio players
    var swish: AVAudioPlayer!
    var sword: AVAudioPlayer!
    
    //x move noise
    func playSwish() {
        do{
            let swishPath = Bundle.main.url(forAuxiliaryExecutable: "/Volumes/BLUE/TicTacToe Sounds/swish.mp3")
            swish = try AVAudioPlayer(contentsOf: swishPath!)
            swish?.play()
        }
        catch{
            //Does nothing
        }
        
    }

    //o move noise
    func playSword() {
        do{
            let swordPath = Bundle.main.url(forAuxiliaryExecutable: "/Volumes/BLUE/TicTacToe Sounds/sword.mp3")
            sword = try AVAudioPlayer(contentsOf: swordPath!)
            sword?.play()
        }
        catch{
            //Does nothing
        }
        
    }
    
    var when = DispatchTime.now() + 1

    

    //reset function for when new game button is pressed
    
    @IBAction func reset(_ sender: Any) {
        
        s1.image = nil
        s2.image = nil
        s3.image = nil
        s4.image = nil
        s5.image = nil
        s6.image = nil
        s7.image = nil
        s8.image = nil
        s9.image = nil
        
        
        print("TTT_ACTIVITY: STARTING NEW GAME")
        whoseTurn.text = "X Goes First"
        mBoard = ["0","1","2","3","4","5","6","7","8"]
    
            for index in 0...8{
            mBoard[index] = ("\(index + 1)")
        }
        
        turn = HUMAN_PLAYER
        win = 0
        displayBoard()
    }
   
    
    //1
    func img1Clicked(){
        if(mBoard[0] != "X" && mBoard[0] != "O"){
        if (win == 0){
        
            if(turn == HUMAN_PLAYER){//1){
            s1.image = #imageLiteral(resourceName: "x_img")
            mBoard[0] = "X"
            playSwish()
            turn = COMPUTER_PLAYER//2
            whoseTurn.text = "O's Turn"
                
                checkForWinner()
                displayBoard()
                updateScore()
                
                //delay
                if (win == 0)
                {
                    when = DispatchTime.now() + 1
                    DispatchQueue.main.asyncAfter(deadline: when){
                        self.getComputerMove()
                        self.playSword()
                        self.checkForWinner()
                        self.updateScore()
                    }
                }
                
        }
    }
// test code to switch it between X and O
//        else{
//            s1.image = #imageLiteral(resourceName: "o_img.png")
//            mBoard[0] = "O"
//            player = 1
//            whoseTurn.text = "X's Turn"
//        }
//        
//        print("TTT_ACTIVITY: ")
//        for index in 0...8{
//            print(mBoard[index])
//        }

        }
    }

    //2
    func img2Clicked(){
     if(mBoard[1] != "X" && mBoard[1] != "O"){
        if (win==0){
            if(turn == HUMAN_PLAYER){
                s2.image = #imageLiteral(resourceName: "x_img")
                mBoard[1] = "X"
                playSwish()
                turn = COMPUTER_PLAYER
                whoseTurn.text = "O's Turn"
            
                
                checkForWinner()
                displayBoard()
                updateScore()
                if (win == 0)
                {
                    when = DispatchTime.now() + 1
                    DispatchQueue.main.asyncAfter(deadline: when){
                        self.getComputerMove()
                        self.playSword()
                        self.checkForWinner()
                        self.updateScore()
                    }
                    
                }
            }
        }
    }
    }
    
    //3
    func img3Clicked(){
    if(mBoard[2] != "X" && mBoard[2] != "O"){
    if (win==0){
        if(turn == HUMAN_PLAYER){
            s3.image = #imageLiteral(resourceName: "x_img")
            mBoard[2] = "X"
            playSwish()
            turn = COMPUTER_PLAYER
            whoseTurn.text = "O's Turn"
            
            displayBoard()
            checkForWinner()
            displayBoard()
            updateScore()
            if (win == 0)
            {
                when = DispatchTime.now() + 1
                DispatchQueue.main.asyncAfter(deadline: when){
                    self.getComputerMove()
                    self.playSword()
                    self.checkForWinner()
                    self.updateScore()
                }
                
            }
            

        }
    }
    }
    }
    
    //4
    func img4Clicked(){
    if(mBoard[3] != "X" && mBoard[3] != "O"){
        if (win == 0){
        if(turn == HUMAN_PLAYER){
            s4.image = #imageLiteral(resourceName: "x_img")
            mBoard[3] = "X"
            playSwish()
            turn = COMPUTER_PLAYER
            whoseTurn.text = "O's Turn"
            
            checkForWinner()
            displayBoard()
            updateScore()
            if (win == 0)
            {
                when = DispatchTime.now() + 1
                DispatchQueue.main.asyncAfter(deadline: when){
                    self.getComputerMove()
                    self.playSword()
                    self.checkForWinner()
                    self.updateScore()
                }
                
            }
            

            
        }
        }
    }
    }
    
    //5
    func img5Clicked(){
    if(mBoard[4] != "X" && mBoard[4] != "O"){
        if (win == 0){
        if(turn == HUMAN_PLAYER){
            s5.image = #imageLiteral(resourceName: "x_img")
            mBoard[4] = "X"
            playSwish()
            turn = COMPUTER_PLAYER
            whoseTurn.text = "O's Turn"
            
            checkForWinner()
            displayBoard()
            updateScore()
            if (win == 0)
            {
                when = DispatchTime.now() + 1
                DispatchQueue.main.asyncAfter(deadline: when){
                    self.getComputerMove()
                    self.playSword()
                    self.checkForWinner()
                    self.updateScore()
                }
            }
            

        }
        }
    }
    }
    
    //6
    func img6Clicked(){
    if(mBoard[5] != "X" && mBoard[5] != "O"){
        if (win == 0){
        if(turn == HUMAN_PLAYER){
            s6.image = #imageLiteral(resourceName: "x_img")
            mBoard[5] = "X"
            playSwish()
            turn = COMPUTER_PLAYER
            whoseTurn.text = "O's Turn"
        
            checkForWinner()
            displayBoard()
            updateScore()
            if (win == 0)
            {
                when = DispatchTime.now() + 1
                DispatchQueue.main.asyncAfter(deadline: when){
                    self.getComputerMove()
                    self.playSword()
                    self.checkForWinner()
                    self.updateScore()
                }
                
            }
            

        }
    }
    }
    }
    
    //7
    func img7Clicked(){
    if(mBoard[6] != "X" && mBoard[6] != "O"){
        if (win == 0){
        if(turn == HUMAN_PLAYER){
            s7.image = #imageLiteral(resourceName: "x_img")
            mBoard[6] = "X"
            playSwish()
            turn = COMPUTER_PLAYER
            whoseTurn.text = "O's Turn"
            
            checkForWinner()
            displayBoard()
            updateScore()
            if (win == 0)
            {
                when = DispatchTime.now() + 1
                DispatchQueue.main.asyncAfter(deadline: when){
                    self.getComputerMove()
                    self.playSword()
                    self.checkForWinner()
                }
            }
            

        }
        }
    }
    }
    
    //8
    func img8Clicked(){
    if(mBoard[7] != "X" && mBoard[7] != "O"){
        if (win == 0){
        if(turn == HUMAN_PLAYER){
            s8.image = #imageLiteral(resourceName: "x_img")
            mBoard[7] = "X"
            playSwish()
            turn = COMPUTER_PLAYER
            whoseTurn.text = "O's Turn"
            
            checkForWinner()
            displayBoard()
            updateScore()
            if (win == 0)
            {
                when = DispatchTime.now() + 1
                DispatchQueue.main.asyncAfter(deadline: when){
                    self.getComputerMove()
                    self.playSword()
                    self.checkForWinner()
                    self.updateScore()
                }
                
            }
            

        }
        }
    }
    }
    
    //9
    func img9Clicked(){
    if(mBoard[8] != "X" && mBoard[8] != "O"){
        if (win == 0){
        if(turn == HUMAN_PLAYER){
            s9.image = #imageLiteral(resourceName: "x_img")
            mBoard[8] = "X"
            playSwish()
            turn = COMPUTER_PLAYER
            whoseTurn.text = "O's Turn"
            
            
            checkForWinner()
            displayBoard()
            updateScore()
            if (win == 0)
            {
                when = DispatchTime.now() + 1
                DispatchQueue.main.asyncAfter(deadline: when){
                    self.getComputerMove()
                    self.playSword()
                    self.checkForWinner()
                    self.updateScore()
                }
                
            }
            

        }
        }
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mBoardArray.append(s1)
        mBoardArray.append(s2)
        mBoardArray.append(s3)
        mBoardArray.append(s4)
        mBoardArray.append(s5)
        mBoardArray.append(s6)
        mBoardArray.append(s7)
        mBoardArray.append(s8)
        mBoardArray.append(s9)
        
        //1
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img1Clicked))
        
        tapGesture1.numberOfTapsRequired = 1
        
        s1.addGestureRecognizer(tapGesture1)
        
        //2
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img2Clicked))
        
        tapGesture2.numberOfTapsRequired = 1
        
        s2.addGestureRecognizer(tapGesture2)
        
        //3
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img3Clicked))
        
        tapGesture3.numberOfTapsRequired = 1
        
        s3.addGestureRecognizer(tapGesture3)
        
        //4
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img4Clicked))
        
        tapGesture4.numberOfTapsRequired = 1
        
        s4.addGestureRecognizer(tapGesture4)
        
        //5
        let tapGesture5 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img5Clicked))
        
        tapGesture5.numberOfTapsRequired = 1
        
        s5.addGestureRecognizer(tapGesture5)
        
        //6
        let tapGesture6 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img6Clicked))
        
        tapGesture6.numberOfTapsRequired = 1
        
        s6.addGestureRecognizer(tapGesture6)
        
        
        //7
        let tapGesture7 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img7Clicked))
        
        tapGesture7.numberOfTapsRequired = 1
        
        s7.addGestureRecognizer(tapGesture7)
        
        //8
        let tapGesture8 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img8Clicked))
        
        tapGesture8.numberOfTapsRequired = 1
        
        s8.addGestureRecognizer(tapGesture8)
        
        //9
        let tapGesture9 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img9Clicked))
        
        tapGesture9.numberOfTapsRequired = 1
        
        s9.addGestureRecognizer(tapGesture9)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func displayBoard(){
        print()
        print(mBoard[0] + " | " + mBoard[1] + " | " + mBoard[2])
        print("-----------")
        print(mBoard[3] + " | " + mBoard[4] + " | " + mBoard[5])
        print("-----------")
        print(mBoard[6] + " | " + mBoard[7] + " | " + mBoard[8])
        print()
        
        print ("win = " + "\(win)")
    }
    
    func getComputerMove()
    {
        
        // First see if there's a move O can make to win
        // Hard and medium only
        if(difficulty <= 1)
        {
        for i in 0 ... BOARD_SIZE-1 {
            if (mBoard[i] != HUMAN_PLAYER && mBoard[i] != COMPUTER_PLAYER) {
                let curr = mBoard[i]
                mBoard[i] = COMPUTER_PLAYER
                checkForWinner()
                if (win == 3) {
                    print("Computer is making winning move to " + String((i)))
                    mBoardArray[i].image = #imageLiteral(resourceName: "o_img.png")
                    turn = HUMAN_PLAYER
                    whoseTurn.text = "X's Turn"
                    displayBoard()
                    return
                }
                else{
                    mBoard[i] = curr;}
            }
        }
        }
        
        // See if there's a move O can make to block X from winning
        // Hard only
        if (difficulty == 0)
        {
        for i in 0 ... BOARD_SIZE-1 {
            if (mBoard[i] != HUMAN_PLAYER && mBoard[i] != COMPUTER_PLAYER) {
                let curr = mBoard[i];   // Save the current number
                mBoard[i] = HUMAN_PLAYER
                checkForWinner()
                if (win == 2) {
                    mBoard[i] = COMPUTER_PLAYER;
                    print("Computer is making a blocking move to " + String((i)))
                    mBoardArray[i].image = #imageLiteral(resourceName: "o_img.png")
                    turn = HUMAN_PLAYER
                    whoseTurn.text = "X's Turn"
                    win = 0
                    displayBoard()
                    return
                }
                else{
                    mBoard[i] = curr}
            }
        }
        }
        
        // Generate random move
        // All 3 difficulties
        if (difficulty <= 2)
        {
        repeat
        {
            move  = Int(arc4random_uniform(9))
            print("random move is " + String(move))
        } while (mBoard[move] == "X" || mBoard[move] == "O")
        
        print("Computer is making a random move to " + String((move)))
        mBoardArray[move].image = #imageLiteral(resourceName: "o_img.png")
        turn = HUMAN_PLAYER
        whoseTurn.text = "X's Turn"

        
        mBoard[move] = COMPUTER_PLAYER
        displayBoard()
    }
    }
    
    
    // Check for a winner.  Return
    //  0 if no winner or tie yet
    //  1 if it's a tie
    //  2 if X won
    //  3 if O won
    func checkForWinner()
    {
        
        // Check horizontal wins
        for i in stride (from: 0, to: 8, by: 3)
        {
            if (mBoard[i] == HUMAN_PLAYER && mBoard[i+1] == HUMAN_PLAYER && mBoard[i+2] == HUMAN_PLAYER)
            {
                win = 2
                whoseTurn.text = "X won"
                return
            }
            
            if (mBoard[i] == COMPUTER_PLAYER && mBoard[i+1] == COMPUTER_PLAYER && mBoard[i+2] == COMPUTER_PLAYER)
            {
                win = 3
                whoseTurn.text = "O won"
                return
            }
        }
        
        // Check vertical wins
        for i in 0 ... 2
        {
            if (mBoard[i] == HUMAN_PLAYER && mBoard[i+3] == HUMAN_PLAYER && mBoard[i+6] == HUMAN_PLAYER)
            {
                win = 2
                whoseTurn.text = "X won"
                return
            }
            
            if (mBoard[i] == COMPUTER_PLAYER && mBoard[i+3] == COMPUTER_PLAYER && mBoard[i+6] == COMPUTER_PLAYER)
            {
                win =  3
                whoseTurn.text = "O won"
                return
            }
        }
        
        // Check for diagonal wins
        if ((mBoard[0] == HUMAN_PLAYER && mBoard[4] == HUMAN_PLAYER && mBoard[8] == HUMAN_PLAYER) || (mBoard[2] == HUMAN_PLAYER && mBoard[4] == HUMAN_PLAYER && mBoard[6] == HUMAN_PLAYER))
        {
            win = 2
            whoseTurn.text = "X won"
            return
        }
        
        if ((mBoard[0] == COMPUTER_PLAYER && mBoard[4] == COMPUTER_PLAYER && mBoard[8] == COMPUTER_PLAYER) || (mBoard[2] == COMPUTER_PLAYER && mBoard[4] == COMPUTER_PLAYER && mBoard[6] == COMPUTER_PLAYER))
        {
            win = 3
            whoseTurn.text = "O won"
            return
        }
        
        // Check for tie
        for i in 0...BOARD_SIZE-1
        {
            // If we find a number, then no one has won yet
            if (mBoard[i] != HUMAN_PLAYER && mBoard[i] != COMPUTER_PLAYER)
            {
                win = 0
                return
            }
        }
        
        // If we make it through the previous loop, all places are taken, so it's a tie
        win = 1
        whoseTurn.text = "It's a Tie!"
    }

    //update function for scoreboard
    func updateScore(){
        
        if (win == 1)
        {
            tie += 1
//            num_ties.text = ("\(tie)")
            GlobalVariables.sharedManager.num_ties = tie
            print("Its a Tie!")
        }
        if (win == 2)
        {
            human += 1
//            human_wins.text = ("\(human)")
            GlobalVariables.sharedManager.human_wins = human
            print("Human won!")
        }
        if (win == 3)
        {
            computer += 1
//            comp_wins.text = ("\(computer)")
            GlobalVariables.sharedManager.comp_wins = computer
            print("Computer won!")
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

