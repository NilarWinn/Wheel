//
//  SpinWheelScene.swift
//  Wheel
//
//  Created by Nilar Win on 18/09/2024.
//

import Foundation
import SpriteKit

class SpinWheelScene: SKScene {
    
    private var spinWheel: SKShapeNode!
    private var pointer: SKSpriteNode!
    private let wheelImages = ["image1", "image2", "image3", "image4"]
    
    override func didMove(to view: SKView) {
        backgroundColor = .white
        setupSpinWheel()
        setupPointer()
    }
    
    private func setupSpinWheel() {
        let wheelRadius: CGFloat = 150
        let numberOfSections = wheelImages.count
        let anglePerSection = 2 * CGFloat.pi / CGFloat(numberOfSections)
        
        spinWheel = SKShapeNode()
        spinWheel.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(spinWheel)
        
        for i in 0..<numberOfSections {
            let startAngle = CGFloat(i) * anglePerSection
            let endAngle = startAngle + anglePerSection
            
            // Create a path for the section
            let path = CGMutablePath()
            path.move(to: CGPoint.zero)
            path.addArc(center: CGPoint.zero, radius: wheelRadius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            path.closeSubpath()
            
            let section = SKShapeNode(path: path)
            section.fillColor = .clear
            section.strokeColor = .black
            section.lineWidth = 2
            section.zRotation = 0 // Adjust if needed
            
            // Create a texture from the image
            let texture = SKTexture(imageNamed: wheelImages[i])
            let sprite = SKSpriteNode(texture: texture)
            sprite.size = CGSize(width: wheelRadius * 2, height: wheelRadius * 2)
            sprite.position = CGPoint(x: wheelRadius * cos(startAngle + anglePerSection / 2),
                                      y: wheelRadius * sin(startAngle + anglePerSection / 2))
            sprite.zRotation = -startAngle - anglePerSection / 2
            spinWheel.addChild(sprite)
        }
        
        // Add border
        let border = SKShapeNode(circleOfRadius: wheelRadius)
        border.lineWidth = 4
        border.strokeColor = .black
        spinWheel.addChild(border)
        
        // Enable physics
        spinWheel.physicsBody = SKPhysicsBody(circleOfRadius: wheelRadius)
        spinWheel.physicsBody?.isDynamic = true
        spinWheel.physicsBody?.allowsRotation = true
        spinWheel.physicsBody?.angularDamping = 0.5
    }
    
    private func setupPointer() {
        pointer = SKSpriteNode(imageNamed: "pointer")
        pointer.position = CGPoint(x: frame.midX, y: frame.midY + 170)
        pointer.zPosition = 1
        addChild(pointer)
    }
    
    // Handle touch to spin
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)
        
        if spinWheel.contains(touchLocation) {
            spinWheel.physicsBody?.angularVelocity = 0
            let randomImpulse = CGFloat.random(in: 5...15)
            spinWheel.physicsBody?.applyAngularImpulse(randomImpulse)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if let angularVelocity = spinWheel.physicsBody?.angularVelocity, abs(angularVelocity) < 0.01 {
            determineSelectedSection()
            spinWheel.physicsBody?.angularVelocity = 0
        }
    }
    
    private func determineSelectedSection() {
        let rotationInDegrees = spinWheel.zRotation * 180 / .pi
        let adjustedRotation = (rotationInDegrees.truncatingRemainder(dividingBy: 360) + 360).truncatingRemainder(dividingBy: 360)
        let numberOfSections = wheelImages.count
        let sectionAngle = 360.0 / Double(numberOfSections)
        let selectedIndex = Int((Double(adjustedRotation) + (sectionAngle / 2)).truncatingRemainder(dividingBy: 360) / sectionAngle)
        let selectedImage = wheelImages[wheelImages.count - 1 - selectedIndex]
        print("Selected Section: \(selectedImage)")
        displaySelectedAlert(selectedImage)
    }
    
    private func displaySelectedAlert(_ selectedImage: String) {
        let alert = UIAlertController(title: "Selected", message: "You landed on \(selectedImage)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        if let viewController = self.view?.window?.rootViewController {
            viewController.present(alert, animated: true, completion: nil)
        }
    }
}
