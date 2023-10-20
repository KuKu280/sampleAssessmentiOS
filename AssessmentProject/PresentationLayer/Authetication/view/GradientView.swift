//
//  GradientView.swift
//  AssessmentProject
//
//  Created by Ku Ku Zan on 10/19/23.
//

import UIKit

@IBDesignable
public class GradientView: UIView {

    public override class var layerClass: AnyClass {
        CAGradientLayer.self
    }

    private var gradientLayer: CAGradientLayer {
        layer as! CAGradientLayer
    }
    
    /// Relative starting point for linear gradient
    /// i.e (0,0) is minXminY and (1,1) is maxXmaxY
    @IBInspectable public var startPoint: CGPoint {
        set { gradientLayer.startPoint = newValue }
        get { gradientLayer.startPoint }
    }
    
    /// Relative ending point for linear gradient
    /// i.e (0,0) is minXminY and (1,1) is maxXmaxY
    @IBInspectable public var endPoint: CGPoint {
        set { gradientLayer.endPoint = newValue }
        get { gradientLayer.endPoint }
    }
    
    private var gradientColors = [UIColor.clear, UIColor.clear]
    
    /// Gradient colors.
    /// Must be at least 2 colors.
    /// If empty colors is provided, clear color is assumed.
    /// If only one color is provided, the other color is assumed as
    /// same color.
    /// Colors more than 2 are assumed as is.
    public var colors: [UIColor] {
        get { gradientColors }
        set {
            gradientColors = newValue
            fixGradientIfBroken()
            forwardGradientsToLayer()
        }
    }
    
    @available(*, unavailable, message: "Storyboard/Xib only value")
    @IBInspectable private var startColor: UIColor {
        set {
            fixGradientIfBroken()
            gradientColors[0] = newValue
            forwardGradientsToLayer()
        }
        get { gradientColors.first! }
    }
    
    @available(*, unavailable, message: "Storyboard/Xib only value")
    @IBInspectable private var endColor: UIColor {
        set {
            fixGradientIfBroken()
            gradientColors[1] = newValue
            forwardGradientsToLayer()
        }
        get { gradientColors.last! }
    }
    
    
    private func fixGradientIfBroken() {
        if gradientColors.isEmpty {
            gradientColors = [.clear, .clear]
        } else if gradientColors.count == 1 {
            gradientColors += gradientColors
        }
    }
    
    private func forwardGradientsToLayer() {
        gradientLayer.colors = gradientColors.map(\.cgColor)
    }
    
    public override class func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
}
