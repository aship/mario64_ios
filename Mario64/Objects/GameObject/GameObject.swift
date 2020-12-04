//
//  GameObject.swift
//  TestSwift
//
//  Created by aship on 2020/11/29.
//

import SceneKit
import SpriteKit

class GameObject: NSObject,
                  SCNSceneRendererDelegate,
                  PadOverlayDelegate,
                  ButtonOverlayDelegate,
                  ObservableObject {
    var pointOfView: SCNNode!
    
    var showsStatistics: Bool = false
    var debugOptions: SCNDebugOptions = []
    
    var scnScene: GameScene!
    
    var skScene = OverlaySKScene()
    
    var character = Character()
    
    var characterDirection: vector_float2 {
        get {
            return character.direction
        }
        set {
            var direction = newValue
            let l = simd_length(direction)
            if l > 1.0 {
                direction *= 1 / l
            }
            character.direction = direction
        }
    }
    
    var cameraDirection = vector_float2.zero {
        didSet {
            let l = simd_length(cameraDirection)
            if l > 1.0 {
                cameraDirection *= 1 / l
            }
            cameraDirection.y = 0
        }
    }
    
    override init() {
        super.init()
        
        print("GEMEOBJECT  INITTTT")
        
        self.scnScene = GameScene(object: self)
        
        self.skScene.gameObject = self
        self.skScene.backgroundColor = .clear
        self.skScene.scaleMode = .resizeFill
        self.skScene.anchorPoint = CGPoint(x: 0.5,
                                           y: 0.5)
        
        
        //   scnScene.gameObject = self
        
        
    }
}
