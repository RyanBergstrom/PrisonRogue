//
//  GameViewController.swift
//  PrisonGame
//
//  Created by Ryan Bergstrom on 4/22/17.
//  Copyright © 2017 Ryan Bergstrom. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    var _health: health = health()
    
    // For displaying the days left
    @IBOutlet weak var lblDaysLeft: UILabel!
    @IBOutlet weak var btnPushUps: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            
            // Last thing we do is update the display
            _health.DaysLeft = _health.DaysAtStart
            
            // A user isn't allowed to do pushups until they uncover it
            btnPushUps.isHidden = true
            
            
            self.UpdateDisplay()
            
        }
    }
    
    
    
    
    

    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    // Whenever we push sleep we want to decrement the Till Free count by 1
    @IBAction func ButtonClick(_ sender: UIButton) {
        
        // This is the sleep button, so we sleep one night
        _health.SleepOneNight()
        
        // Then update the display
        self.UpdateDisplay()
        
    }
    
    
    // This is the routine used for whenever you first enter cellblock
    func InitializeCellBlcok(){
        
        
    }
    
    
    
    // Each class should have one of these to update the display on the page
    // I will probably move it to an inheritd class because of the common pages that
    // will be shared between different pages
    func UpdateDisplay(){
        
        // We need to check what buttons can be shown
        if _health.DaysLogged >= _health.DaysShowPushups && btnPushUps.isHidden{
            btnPushUps.isHidden = false
        }
        
        // When we first start up set the days at start = to the health class
        lblDaysLeft.text = _health.DaysLeft.description
    
    
    }
    
    
    
}
