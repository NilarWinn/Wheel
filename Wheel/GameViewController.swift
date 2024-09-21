//
//  GameViewController.swift
//  Wheel
//
//  Created by Nilar Win on 18/09/2024.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the SKScene from SpinWheelScene
        let scene = SpinWheelScene(size: view.bounds.size)
        scene.scaleMode = .resizeFill
        
        // Present the scene
        let skView = SKView(frame: view.bounds)
        skView.presentScene(scene)
        
        // Configure the view
        skView.ignoresSiblingOrder = true
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        view.addSubview(skView)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
