import UIKit

class FortuneWheelView: UIView {

    // MARK: - Properties

    var images: [UIImage] = [] {
        didSet {
            setupWheel()
        }
    }

    private let wheelLayer = CAShapeLayer()
    private var isSpinning = false

    // Configuration
    var numberOfSegments: Int {
        return images.count
    }
    
    var spinDuration: Double = 4.0 // seconds
    var spinMultiple: Double = 5 // how many full rotations

    // Selected segment callback
    var didSelectSegment: ((Int, UIImage) -> Void)?
    
    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupWheel()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupWheel()
    }

    // MARK: - Setup Wheel

    private func setupWheel() {
        // Remove existing sublayers
        wheelLayer.removeFromSuperlayer()
        layer.sublayers?.forEach { $0.removeFromSuperlayer() }

        // Remove existing image subviews except the pointer
        subviews.forEach { subview in
            if subview is UIImageView || (subview is UIView && subview.tag != 999) { // assuming pointer has tag 999
                subview.removeFromSuperview()
            }
        }

        guard images.count > 0 else { return }

        // Define wheel path
        let radius = min(bounds.width, bounds.height) / 2
        let centerPoint = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let wheelPath = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)

        // Configure wheel layer
        wheelLayer.path = wheelPath.cgPath
        wheelLayer.fillColor = UIColor.clear.cgColor
        wheelLayer.strokeColor = UIColor.clear.cgColor
        wheelLayer.lineWidth = 0

        layer.addSublayer(wheelLayer)

        // Add images as subviews arranged in segments
        addImageSegments()
    }

    private func addImageSegments() {
        let numberOfSegments = images.count
        let anglePerSegment = 2 * Double.pi / Double(numberOfSegments)
        let radius = min(bounds.width, bounds.height) / 2
        let centerPoint = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let imageSize = CGSize(width: radius * 0.5, height: radius * 0.5) // Adjust as needed

        for (index, image) in images.enumerated() {
            let angle = anglePerSegment * Double(index) + anglePerSegment / 2

            // Calculate image position
            let x = centerPoint.x + CGFloat(cos(angle)) * (radius * 0.6) - imageSize.width / 2
            let y = centerPoint.y + CGFloat(sin(angle)) * (radius * 0.6) - imageSize.height / 2

            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(origin: CGPoint(x: x, y: y), size: imageSize)
            imageView.contentMode = .scaleAspectFit
            imageView.layer.cornerRadius = imageSize.width / 2
            imageView.clipsToBounds = true

            addSubview(imageView)
        }

        // Add a pointer indicator
        addPointer()
    }

    private func addPointer() {
        let pointerSize = CGSize(width: 20, height: 20)
        let pointer = UIView(frame: CGRect(x: bounds.width / 2 - pointerSize.width / 2, y: 10, width: pointerSize.width, height: pointerSize.height))
        pointer.backgroundColor = UIColor.red
        pointer.layer.cornerRadius = pointerSize.width / 2
        pointer.layer.borderColor = UIColor.white.cgColor
        pointer.layer.borderWidth = 2
        pointer.tag = 999 // Assign a tag to identify the pointer
        addSubview(pointer)
    }

    // MARK: - Spin Animation

    func spinWheel() {
        guard !isSpinning, images.count > 0 else { return }
        isSpinning = true

        // Calculate random rotation
        let fullRotation = CGFloat(spinMultiple * 2 * Double.pi)
        let randomRotation = CGFloat(Double.random(in: 0..<2 * Double.pi))
        let totalRotation = fullRotation + randomRotation

        // Animate rotation
        UIView.animate(withDuration: spinDuration, delay: 0, options: .curveEaseOut, animations: {
            self.transform = self.transform.rotated(by: totalRotation)
        }) { _ in
            self.isSpinning = false
            self.determineSelectedSegment(finalRotation: self.rotation) // Corrected line
        }
    }

    // MARK: - Determine Selected Segment

    private func determineSelectedSegment(finalRotation: CGFloat) {
        // Normalize rotation between 0 and 2π
        var angle = finalRotation.truncatingRemainder(dividingBy: 2 * CGFloat.pi)
        if angle < 0 { angle += 2 * CGFloat.pi }

        // Calculate angle per segment
        let anglePerSegment = 2 * CGFloat.pi / CGFloat(numberOfSegments)

        // The top (pointer) corresponds to angle π/2
        let adjustedAngle = (CGFloat.pi / 2 - angle).truncatingRemainder(dividingBy: 2 * CGFloat.pi)
        var selectedIndex = Int(adjustedAngle / anglePerSegment)

        if selectedIndex < 0 {
            selectedIndex += numberOfSegments
        }

        if selectedIndex >= numberOfSegments {
            selectedIndex -= numberOfSegments
        }

        // Callback
        let selectedImage = images[selectedIndex]
        didSelectSegment?(selectedIndex, selectedImage)
    }
}

// Extension to get the current rotation angle from transform
extension UIView {
    var rotation: CGFloat {
        return atan2(self.transform.a, self.transform.b)
    }
}
