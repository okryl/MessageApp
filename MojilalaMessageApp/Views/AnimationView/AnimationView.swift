//
//  AnimationView.swift
//  MojilalaMessageApp
//
//  Created by Omer Karayel on 26/02/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import UIKit

protocol AnimationViewDelegate: class {
    func animationDone()
}

class AnimationView: UIView {
    
    //properties
    private var charecterArray: [Character] = []
    private var charViewArray: [UIView] = []
    weak var delegate: AnimationViewDelegate?
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    convenience init(frame: CGRect, charecterArray: [Character]) {
        self.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Animation
  
    func appAnimation(isAnimation: Bool) {
        charecterArray = ["M","E","S","S","A","G","E"]
        guard charecterArray.count != 0 else { return }
        
        addLabelToViews(isAnimation)
    }
    
    private func addLabelToViews(_ isAnimation: Bool){
        var currentX: CGFloat = 0
        
        for _ in 0..<charecterArray.count {
            
            let charView = UIView(frame: CGRect(x: 0, y: 0, width: bounds.width/CGFloat(charecterArray.count), height: bounds.height))
            charView.backgroundColor = .clear
            addSubview(charView)
            charViewArray.append(charView)
            
            charView.frame.origin.x = isAnimation ? currentX + 500 : currentX
            
            currentX += charView.frame.width
        }
        
        for i in 0..<charecterArray.count {
            let label = UILabel()
            label.font = UIFont(name: "Helvetica-Neue-Bold", size: 30)
            label.sizeToFit()
            label.textColor = .white
            label.adjustsFontSizeToFitWidth = true
            label.text = String(charecterArray[i])
            label.textAlignment = .center
            label.frame = charViewArray[i].bounds
            
            charViewArray[i].addSubview(label)
        }
        
        if isAnimation {
            startAnimation()
        }
    }
    
    private func startAnimation() {
        
        var delayTime: TimeInterval = 0
        
        charViewArray.forEach { (view) in
            
            UIView.animate(withDuration: 0.5, delay: delayTime, usingSpringWithDamping: 0.8, initialSpringVelocity: 5, options: .transitionCurlUp, animations: {
                view.frame.origin.x = view.frame.origin.x - 500.0
            }, completion: nil)
            delayTime = delayTime + 0.2
        }
        
        let completionDelay = Double(charViewArray.count) * 0.1
        
        delay(seconds: completionDelay) {
            self.delegate?.animationDone()
        }
    }
}
