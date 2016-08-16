//
//  ResultViewController.swift
//  RockPaperScissor
//
//  Created by Minjie Zhu on 8/14/16.
//  Copyright © 2016 Minjie Zhu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController
{
    
    
    
    @IBAction func playAgain() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var resultLabel : UILabel!
    @IBOutlet weak var resultImage : UIImageView!
    
    var result : PlayViewController.RPSResult?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let res = result {
            
            switch res {
            case .Tile:
                resultLabel.text = "This is a tie!"
                resultImage.image = UIImage(named: "itsATie")
                
            case let .Win(first, _):
                let msg = "You Win! "
                updateUI(msg, winner: first)
                
            case let .Lose(_, second):
                let msg = "You lose. "
                updateUI(msg, winner: second)
            }
        }
    }
    
    func updateUI(msg : String, winner : PlayViewController.RPS) {
        switch winner {
        case .ROCKET:
            resultLabel.text = msg + "Rock Crushes Scissors."
            resultImage.image = UIImage(named: "RockCrushesScissors")
            
        case .PAPER:
            resultLabel.text = msg + "Paper Covers Rock."
            resultImage.image = UIImage(named: "PaperCoversRock")
            
        case .SCISSOR:
            resultLabel.text = msg + "Scissors Cut Paper."
            resultImage.image = UIImage(named: "ScissorsCutPaper")
        }
    }

}
