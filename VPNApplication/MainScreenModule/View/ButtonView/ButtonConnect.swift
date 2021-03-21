//
//  Button.swift
//  VPNApplication
//
//  Created by Vadzim Ivanchanka on 21.03.21.
//

import UIKit


final class ButtonConnection:UIButton {
    
    static let path = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true).cgPath
    
    let pulseLayer:CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.path = path
        layer.fillColor = #colorLiteral(red: 0.1744953096, green: 0.1960964799, blue: 0.5595155358, alpha: 0.9403141855)
        layer.lineCap = CAShapeLayerLineCap.round
        return layer
    }()
    
    let logo:CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.path = path
        layer.fillColor = #colorLiteral(red: 0.3612610996, green: 0.407785058, blue: 0.7727187276, alpha: 1)
        layer.lineCap = CAShapeLayerLineCap.round
        return layer
    }()
    
    let title:UILabel = {
        let label = UILabel()
        label.text = "Connect"
        label.textColor = .white
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 25)
        label.textAlignment = .center
        label.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 23)
        return label
    }()
    
    
    
    func animatingButton(isAnimating:Bool) {
        if isAnimating {
            pulseLayer.isHidden = false
            let animating = CABasicAnimation(keyPath: "transform.scale")
            animating.toValue = 1.5
            animating.duration = 0.5
            animating.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
            animating.autoreverses = true
            animating.repeatCount = Float.infinity
            pulseLayer.add(animating, forKey: "pulsing")
        } else {
            pulseLayer.isHidden = true
        }
    }
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        logo.position = self.center
        pulseLayer.position = self.center
        title.center = self.center
        animatingButton(isAnimating: false)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.addSublayer(pulseLayer)
        self.layer.addSublayer(logo)
        self.addSubview(title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
