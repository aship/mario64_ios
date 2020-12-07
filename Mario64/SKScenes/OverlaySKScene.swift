//
//  GameSKScene.swift
//  TestSwift
//
//  Created by aship on 2020/12/02.
//

import SpriteKit

class OverlaySKScene: SKScene {
    var gameObject: GameObject?
    
    var leftPad = PadOverlay()
    var rightPad = PadOverlay()
    var buttonA = ButtonOverlay("A")
    var buttonB = ButtonOverlay("B")
    
    override func didMove(to view: SKView) {
        self.view?.isMultipleTouchEnabled = true

        self.leftPad.delegate = self.gameObject
        self.rightPad.delegate = self.gameObject
        self.buttonA.delegate = self.gameObject
        self.buttonB.delegate = self.gameObject
        
      //  leftPad.anchorPoint = CGPoint(x: 0.5,
                                   //    y: 0.5)
      //  leftPad.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        leftPad.position = CGPoint(x: CGFloat(-300),
                                   y: CGFloat(-160))
        addChild(leftPad)
        
        rightPad.position = CGPoint(x: CGFloat(150),
                                   y: CGFloat(30))
        addChild(rightPad)
        
        let buttonDistance = 100.0
        let center = CGPoint(x: 0.0,
                              y: 0.0)
        
        let diffX: CGFloat = 240.0
        let diffY: CGFloat = -180.0
        

        
        let buttonAx = center.x - CGFloat(buttonDistance) * CGFloat(cosf(Float.pi / 2.0)) - (buttonA.size.width / 2)
        let buttonAy = center.y + CGFloat(buttonDistance) * CGFloat(sinf(Float.pi / 2.0)) - (buttonA.size.height / 2)
        
        buttonA.position = CGPoint(x: buttonAx + diffX,
                                   y: buttonAy + diffY)
        addChild(buttonA)
        
        let buttonBx = center.x - CGFloat(buttonDistance) * CGFloat(cosf(Float.pi / 4.0)) - (buttonA.size.width / 2)
        let buttonBy = center.y + CGFloat(buttonDistance) * CGFloat(sinf(Float.pi / 4.0)) - (buttonA.size.height / 2)
        
        buttonB.position = CGPoint(x: buttonBx + diffX,
                                   y: buttonBy + diffY)
        addChild(buttonB)
    }
}
