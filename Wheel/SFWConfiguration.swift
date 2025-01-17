//
//  SFWConfiguration.swift
//  Wheel
//
//  Created by Nilar Win on 18/09/2024.
//

import Foundation
import UIKit
import SwiftFortuneWheel
private let yellowColor = UIColor.yellow
private let blackColor = UIColor.systemPink.withAlphaComponent(0.1)
private let cyanColor = UIColor.systemPink
private let circleStrokeWidth: CGFloat = 10
private let _position: SFWConfiguration.Position = .top

extension SFWConfiguration {
    static var blackCyanColorsConfiguration: SFWConfiguration {
        
        var imageAnchor = SFWConfiguration.AnchorImage(imageName: "filled-circle",
                                                                     size: CGSize(width: 10, height: 10),
                                                                     verticalOffset: -circleStrokeWidth / 2)
        
        imageAnchor.tintColor = .white
        
        let circlePreferences = SFWConfiguration.CirclePreferences(strokeWidth: circleStrokeWidth,
                                                                           strokeColor: yellowColor)
        
        let sliceBackgroundColorType = SFWConfiguration.ColorType.evenOddColors(evenColor: blackColor, oddColor: cyanColor)
        
        let slicePreferences = SFWConfiguration.SlicePreferences(backgroundColorType: sliceBackgroundColorType,
                                                                          strokeWidth: 0,
                                                                          strokeColor: .yellow)
        
        var wheelPreference = SFWConfiguration.WheelPreferences(circlePreferences: circlePreferences,
                                                                          slicePreferences: slicePreferences,
                                                                          startPosition: _position)
        
        wheelPreference.imageAnchor = imageAnchor
        
        let pinPreferences = SFWConfiguration.PinImageViewPreferences(size: CGSize(width: 50, height: 50),
                                                                                 position: _position,
                                                                                 verticalOffset: -30)
        
        var spinButtonPreferences = SFWConfiguration.SpinButtonPreferences(size: CGSize(width: 80, height: 80))
        
        spinButtonPreferences.cornerRadius = 40
        spinButtonPreferences.textColor = .white
        spinButtonPreferences.font = .systemFont(ofSize: 20, weight: .bold)
        spinButtonPreferences.backgroundColor = yellowColor
        
        let configuration = SFWConfiguration(wheelPreferences: wheelPreference,
                                             pinPreferences: pinPreferences)
        return configuration
    }
    
    static var rainbowColorsConfiguration: SFWConfiguration {

        let position: SFWConfiguration.Position = .bottom
        
        var centerImageAnchor = SFWConfiguration.AnchorImage(imageName: "filled-circle",
                                                                size: CGSize(width: 10, height: 10),
                                                                verticalOffset: -circleStrokeWidth / 2)
        
        centerImageAnchor.tintColor = .white
        
        let circlePreferences = SFWConfiguration.CirclePreferences(strokeWidth: circleStrokeWidth,
                                                                           strokeColor: blackColor)
        
        let sliceBackgroundColorType = SFWConfiguration.ColorType.customPatternColors(colors: [.blue, .brown, .green, .cyan, .magenta, .orange, .purple, .yellow, .systemPink, .systemTeal, .brown, .green, .cyan], defaultColor: .red)
        
        let slicePreferences = SFWConfiguration.SlicePreferences(backgroundColorType: sliceBackgroundColorType,
                                                                            strokeWidth: 1,
                                                                            strokeColor: blackColor)
        
        var wheelPreferences = SFWConfiguration.WheelPreferences(circlePreferences: circlePreferences,
                                                                          slicePreferences: slicePreferences,
                                                                          startPosition: position)
        
        wheelPreferences.centerImageAnchor = centerImageAnchor
        
        let pinPreferences = SFWConfiguration.PinImageViewPreferences(size: CGSize(width: 50, height: 50),
                                                                                 position: position,
                                                                                 verticalOffset: 30)
        
        var spinButtonPreferences = SFWConfiguration.SpinButtonPreferences(size: CGSize(width: 80, height: 80))
        
        spinButtonPreferences.cornerRadius = 40
        spinButtonPreferences.textColor = .white
        spinButtonPreferences.font = .systemFont(ofSize: 20, weight: .bold)
        spinButtonPreferences.backgroundColor = blackColor
        
        let configuration = SFWConfiguration(wheelPreferences: wheelPreferences,
                                             pinPreferences: pinPreferences,
                                             spinButtonPreferences: spinButtonPreferences)

        return configuration
    }
}

extension ImagePreferences {
    static var prizeImagePreferences: ImagePreferences {
        let preferences = ImagePreferences(preferredSize: CGSize(width: 50, height: 50),
                                           verticalOffset: 10)
        return preferences
    }
}

extension TextPreferences {
    static var amountTextWithWhiteBlackColorsPreferences: TextPreferences {
        let textColorType = SFWConfiguration.ColorType.evenOddColors(evenColor: .white, oddColor: blackColor)
        let font = UIFont.systemFont(ofSize: 20, weight: .bold)
        let prefenreces = TextPreferences(textColorType: textColorType,
                                          font: font,
                                          verticalOffset: 10)
        return prefenreces
    }
    
    static var descriptionTextWithWhiteBlackColorsPreferences: TextPreferences {
        let textColorType = SFWConfiguration.ColorType.evenOddColors(evenColor: .white, oddColor: blackColor)
        let font = UIFont.systemFont(ofSize: 10, weight: .bold)
        let prefenreces = TextPreferences(textColorType: textColorType,
                                          font: font,
                                          verticalOffset: 10)
        return prefenreces
    }
    
    
    static var amountTextWithBlackColorPreferences: TextPreferences {
        let textColorType = SFWConfiguration.ColorType.customPatternColors(colors: nil, defaultColor: .black)
        let font = UIFont.systemFont(ofSize: 20, weight: .bold)
        let prefenreces = TextPreferences(textColorType: textColorType,
                                          font: font,
                                          verticalOffset: 10)
        return prefenreces
    }
    
    static var descriptionTextWithBlackColorPreferences: TextPreferences {
        let textColorType = SFWConfiguration.ColorType.customPatternColors(colors: nil, defaultColor: .black)
        let font = UIFont.systemFont(ofSize: 10, weight: .bold)
        let prefenreces = TextPreferences(textColorType: textColorType,
                                          font: font,
                                          verticalOffset: 10)
        return prefenreces
    }
}


extension LinePreferences {
    static var defaultPreferences: LinePreferences {
        let colorType = SFWConfiguration.ColorType.customPatternColors(colors: [.orange, .purple, .yellow, .blue, .brown, .green, .systemPink, .systemTeal, .brown, .green, .white, .black, .magenta], defaultColor: .red)
        let preferences = LinePreferences(colorType: colorType, height: 2, verticalOffset: 10)
        return preferences
    }
}
