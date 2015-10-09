//
//  ViewController.swift
//  tapper2
//
//  Created by C Sinclair on 10/8/15.
//  Copyright © 2015 mingdyn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //Properties
    var maxTaps = 0
    var currentTaps = 0
    
    
    //Outlets
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var tapLbl: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var tapsToWinTxt: UITextField!
    @IBOutlet weak var tapBtn: UIButton!
    
    @IBAction func onCoinTapped(sender: UIButton!){
        currentTaps++
        updateTapsLbl()
        
        if isGameOver(){
            restartGame() 
        }
    }
    
    // handles dismissing keyboard if you touch outside the keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    

    
    @IBAction func playBtnPressed(sender: UIButton!) {
        
        if tapsToWinTxt.text != nil && tapsToWinTxt.text != ""{
            logo.hidden = true
            playBtn.hidden = true
            tapsToWinTxt.hidden = true
            
            tapBtn.hidden = false
            tapLbl.hidden = false

            maxTaps = Int(tapsToWinTxt.text!)!
            currentTaps = 0
            
            updateTapsLbl()
        }
    }
    
    func restartGame(){
        maxTaps = 0
        tapsToWinTxt.text = ""
        
        logo.hidden = false
        playBtn.hidden = false
        tapsToWinTxt.hidden = false
        
        tapBtn.hidden = true
        tapLbl.hidden = true
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps{
            return true
        }else{
            return false
        }
    }
    
    func updateTapsLbl(){
        tapLbl.text = "\(currentTaps) Taps"
    }


}

