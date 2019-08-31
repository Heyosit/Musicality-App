//
//  SegmentedControlNode.swift
//  The Haptic Game - Runner
//
//  Created by Alessio Perrotti on 29/11/2018.
//  Copyright © 2018 Alessio Perrotti. All rights reserved.
//

import SpriteKit

protocol SegmentedControlDelegate {
   func SegmentedControlTapped(_ sender: SegmentedControl)
}

class SegmentedControl: ButtonNode {
    var delegateSegContr: SegmentedControlDelegate?
    
    convenience init(imageNamed: String, for state: ButtonState) {
        let texture = SKTexture(imageNamed: imageNamed)
        self.init(texture: texture)
        self.normalImageName = imageNamed
        self.highlightedImageName = imageNamed
        self.disabledImageName = imageNamed
        self.isUserInteractionEnabled = true
    }
    

    func changeTextures(texture: String) {
        self.normalImageName = texture + Consts.Names.ButtonStateNames.normal
        self.highlightedImageName = texture + Consts.Names.ButtonStateNames.highlighted
        state = .normal
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard state == .highlighted else { return }
        super.touchesEnded(touches, with: event)
        delegateSegContr?.SegmentedControlTapped(self)
        
    }
    
}
