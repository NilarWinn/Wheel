//
//  TestVC.swift
//  Wheel
//
//  Created by Nilar Win on 18/09/2024.
//

import Foundation
import UIKit
//import SpinWheelControl

//class TestVC: UIViewController, SpinWheelControlDelegate {
//    
//    private var spinWheel: SpinWheelControl!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        //        setupLabelWithBackgroundImage()
//        setupSpinWheel()
//    }
//    
//    private func setupLabelWithBackgroundImage() {
//        // Create and configure the UILabel
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Hello, World!"
//        label.textColor = .white
//        label.textAlignment = .center
//        label.font = UIFont.boldSystemFont(ofSize: 24)
//        
//        // Add label to the view
//        view.addSubview(label)
//        
//        // Set up Auto Layout constraints for the label
//        NSLayoutConstraint.activate([
//            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            label.widthAnchor.constraint(equalToConstant: 200),
//            label.heightAnchor.constraint(equalToConstant: 100)
//        ])
//        
//        // Create a UIImageView with the background image
//        let backgroundImage = UIImage(named: "prize1")!
//        let backgroundImageView = UIImageView(image: backgroundImage)
//        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
//        backgroundImageView.contentMode = .scaleAspectFill
//        
//        // Add the UIImageView to the view
//        view.addSubview(backgroundImageView)
//        
//        // Set up Auto Layout constraints for the UIImageView
//        NSLayoutConstraint.activate([
//            backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            backgroundImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            backgroundImageView.widthAnchor.constraint(equalToConstant: 200),
//            backgroundImageView.heightAnchor.constraint(equalToConstant: 100)
//        ])
//        
//        // Send the backgroundImageView behind the label
//        view.sendSubviewToBack(backgroundImageView)
//    }
//    
//    private func setupSpinWheel() {
//            // Initialize SpinWheelControl
//            spinWheel = SpinWheelControl(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
//            spinWheel.center = view.center
//            view.addSubview(spinWheel)
//
//            // Define number of wedges
//            let numberOfWedges = 6
//
//            // Create custom wedges
//            let wedgeWidth = spinWheel.frame.width / CGFloat(numberOfWedges)
//            let wedgeHeight = spinWheel.frame.height
//
//            for i in 0..<numberOfWedges {
//                let wedgeView = UIView(frame: CGRect(x: 0, y: 0, width: wedgeWidth, height: wedgeHeight))
//                wedgeView.backgroundColor = .clear
//
//                let imageName = "prize1"
//                if let image = UIImage(named: imageName) {
//                    let imageView = UIImageView(image: image)
//                    imageView.contentMode = .scaleAspectFit
//                    imageView.frame = wedgeView.bounds
//                    wedgeView.addSubview(imageView)
//                }
//
//                // Rotate wedge view to its position
//                wedgeView.transform = CGAffineTransform(rotationAngle: CGFloat(i) * (2 * .pi / CGFloat(numberOfWedges)))
//                spinWheel.addSubview(wedgeView)
//            }
//
//            // Optionally, add gesture recognizers or other controls
//            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleSpin))
//            spinWheel.addGestureRecognizer(tapGesture)
//        }
//
//        @objc private func handleSpin() {
//            // Trigger spin action
//            // For example, you can animate the spinWheel here
//            UIView.animate(withDuration: 2.0) {
//                self.spinWheel.transform = self.spinWheel.transform.rotated(by: .pi)
//            }
//        }
//}

