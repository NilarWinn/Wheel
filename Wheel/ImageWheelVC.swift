//
//  ImageWheelVC.swift
//  Wheel
//
//  Created by Nilar Win on 18/09/2024.
//

import Foundation
import UIKit
//import TTFortuneWheel
import SwiftFortuneWheel

class ImageWheelVC: UIViewController {

    
//    @IBOutlet weak var fortuneWheel: SwiftFortuneWheel!

//        let prizes = [
//            UIImage(named: "prize1"),
//            UIImage(named: "prize1"),
//            UIImage(named: "prize1"),
//            UIImage(named: "prize1"),
//            UIImage(named: "prize1")
//        ]
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//
//            let slices = prizes.compactMap { prizeImage -> Slice? in
//                guard let image = prizeImage else { return nil }
//                // Create ImagePreferences instance
//                let imagePreferences = ImagePreferences(
//                               preferredSize: CGSize(width: 50, height: 50),
//                               verticalOffset: 0
//                           )
//                
//                let content = Slice.ContentType.image(image: image, preferences: imagePreferences)
//                
//                // Return the Slice
//                return Slice(contents: [content])
//            }
//
//            fortuneWheel.slices = slices
//            fortuneWheel.spinImage = "center"
//            fortuneWheel.isSpinEnabled = false
//        }
//
//    private func loadImages(for urls: [String], completion: @escaping ([UIImage]) -> Void) {
//        var images = [UIImage]()
//        let dispatchGroup = DispatchGroup()
//        
//        
//        for urlString in urls {
//            dispatchGroup.enter()
//            if let url = URL(string: urlString) {
//                let task = URLSession.shared.dataTask(with: url) { data, response, error in
//                    defer { dispatchGroup.leave() }
//                    if let data = data, let image = UIImage(data: data) {
//                        images.append(image)
//                    } else {
//                        images.append(UIImage()) // Placeholder image if download fails
//                    }
//                }
//                task.resume()
//            } else {
//                dispatchGroup.leave()
//                images.append(UIImage()) // Placeholder for invalid URL
//            }
//        }
//        
//        dispatchGroup.notify(queue: .main) {
//            completion(images)
//        }
//    }
    
    let fortuneWheel = FortuneWheelView()
        let spinButton = UIButton(type: .system)
        let resultLabel = UILabel()

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white

            setupFortuneWheel()
            setupSpinButton()
            setupResultLabel()
        }

        private func setupFortuneWheel() {
            // Set the wheel size and position
            let wheelSize: CGFloat = 300
            fortuneWheel.frame = CGRect(x: (view.bounds.width - wheelSize) / 2, y: 150, width: wheelSize, height: wheelSize)
            fortuneWheel.images = loadWheelImages()
            fortuneWheel.didSelectSegment = { [weak self] index, image in
                self?.resultLabel.text = "Selected Segment: \(index + 1)"
                // Optionally, you can show the selected image
                // self?.showSelectedImage(image, at: index)
            }

            view.addSubview(fortuneWheel)
        }

        private func loadWheelImages() -> [UIImage] {
            // Replace these with your image names
            let imageNames = ["prize1", "prize1", "prize1", "prize1", "prize1", "prize1"]
            return imageNames.compactMap { UIImage(named: $0) }
        }

        private func setupSpinButton() {
            spinButton.setTitle("Spin", for: .normal)
            spinButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
            spinButton.setTitleColor(.white, for: .normal)
            spinButton.backgroundColor = .systemBlue
            spinButton.layer.cornerRadius = 10
            spinButton.translatesAutoresizingMaskIntoConstraints = false

            spinButton.addTarget(self, action: #selector(spinButtonTapped), for: .touchUpInside)

            view.addSubview(spinButton)

            // Constraints
            NSLayoutConstraint.activate([
                spinButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                spinButton.topAnchor.constraint(equalTo: fortuneWheel.bottomAnchor, constant: 50),
                spinButton.widthAnchor.constraint(equalToConstant: 150),
                spinButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        }

        private func setupResultLabel() {
            resultLabel.text = "Selected Segment: None"
            resultLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
            resultLabel.textColor = .darkGray
            resultLabel.textAlignment = .center
            resultLabel.translatesAutoresizingMaskIntoConstraints = false

            view.addSubview(resultLabel)

            // Constraints
            NSLayoutConstraint.activate([
                resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                resultLabel.topAnchor.constraint(equalTo: spinButton.bottomAnchor, constant: 30),
                resultLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
                resultLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
        }

        @objc private func spinButtonTapped() {
            fortuneWheel.spinWheel()
        }
    
}
