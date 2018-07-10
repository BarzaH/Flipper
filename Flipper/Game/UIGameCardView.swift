//
//  UIGameCardView.swift
//  Flipper
//
//  Created by Mergaliev Ibragim on 06/07/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import UIKit

@IBDesignable
class UIGameCardView: UIButton {
    
    var isUp: Bool = true {didSet{setNeedsDisplay(); setNeedsLayout()}}
    
    override func draw(_ rect: CGRect) {
        UIView.transition(with: self, duration: 0.6, options: [.transitionFlipFromLeft], animations: {
            if self.isUp{
                self.setBackgroundImage(nil, for: UIControlState.normal)
                self.drawUpperLeftLayer()
                self.drawBottomRightLayer()
            }
            else{
                self.setImage()
                self.removeSublayers()
            }
        })
    }
    
    func drawUpperLeftLayer(){
        let ctl = initStandardLayer()
        self.layer.addSublayer(ctl)
    }
    
    func drawBottomRightLayer(){
        let ctl = initStandardLayer()
        ctl.frame.origin = CGPoint(x: self.bounds.origin.x + self.bounds.width - ctl.frame.width, y: self.bounds.origin.y + self.bounds.height - ctl.frame.height)
        self.layer.addSublayer(ctl)
    }
    
    func initStandardLayer() -> CATextLayer{
        let ctl = CATextLayer()
        ctl.fontSize = 18
        ctl.string = self.title(for: .normal)
        ctl.frame = self.bounds
        ctl.frame.size = ctl.preferredFrameSize()
        return ctl
    }
    
    func setImage(){
        if let image = BackgroundImageManager.shared.fetch(){
            self.setBackgroundImage(image, for: UIControlState.normal)
        }
        else{
            let image = UIImage(named: BackgroundImageManager.shared.imageName, in: Bundle(for: self.classForCoder), compatibleWith: self.traitCollection)
            self.setBackgroundImage(image, for: UIControlState.normal)
        }
    }
    
    func removeSublayers(){
        let _ = self.layer.sublayers?.popLast()
        let _ = self.layer.sublayers?.popLast()
    }
}
