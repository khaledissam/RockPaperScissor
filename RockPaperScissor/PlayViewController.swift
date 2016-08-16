//
//  PlayViewController
//  RockPaperScissor:
//
//  Created by Minjie Zhu on 8/14/16.
//  Copyright © 2016 Minjie Zhu. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    
    // MARK: data
    enum RPS : Int {
        case ROCKET = 1
        case PAPER = 2
        case SCISSOR = 3
        
        func compare(other : RPS) -> RPSResult {
            var diff = self.rawValue - other.rawValue
            if diff == 0 {
                return .Tile(self,other)
            }
            if abs(diff) == 2 {
                diff = -diff
            }
            if diff > 0 {
                return .Win(self,other)
            }
            return .Lose(self,other)
        }
        
    }
    
    enum RPSResult {
        case Tile(RPS, RPS)
        case Win(RPS, RPS)
        case Lose(RPS, RPS)
    }

    // MARK: button functions
    @IBAction func pressStone() {
        
        let res = playRPS(RPS.ROCKET)
        
        // Get the ResultViewController
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
        
        controller.result = res
 
        // Present the view Controller
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    @IBAction func pressPaper() {
        
        self.performSegueWithIdentifier("pressPaper", sender: self)
    }

    // MARK: segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "pressPaper" {
            
            if let controller = segue.destinationViewController as? ResultViewController {
                let res = playRPS(RPS.PAPER)
                controller.result = res
            }
            
            
            
        } else if segue.identifier == "pressScissor" {
            
            if let controller = segue.destinationViewController as? ResultViewController {
                let res = playRPS(RPS.SCISSOR)
                controller.result = res
            }
            
            
        }
    }
    
    // MARK: utility functions
    /**
     * Randomly generates a Int from 1 to 3
     */
    func opponentMove() -> RPS {
        
        // Generate a random Int32 using arc4Random
        let randomValue = 1 + arc4random() % 3
        
        // Return a more convenient Int, initialized with the random value
        return RPS(rawValue: Int(randomValue))!
    }
    
    func playRPS(myRPS : RPS) -> RPSResult {
        return myRPS.compare(opponentMove())
    }
}

