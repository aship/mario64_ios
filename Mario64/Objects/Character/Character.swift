//
//  Character.swift
//  TestSwift
//
//  Created by aship on 2020/12/02.
//

import SceneKit

class Character: NSObject {
    var characterNode: SCNNode!
    
    // some constants
    static let gravity = Float(0.004)
    static let jumpImpulse = Float(0.1)
//    static let minAltitude = Float(-10)
//    static let enableFootStepSound = true
//    static let collisionMargin = Float(0.04)
//    static let modelOffset = SIMD3<Float>(0, -collisionMargin, 0)
//    static let collisionMeshBitMask = 8
    
    // Physics
    //var characterCollisionShape: SCNPhysicsShape?
    //var collisionShapeOffsetFromModel = SIMD3<Float>.zero
    var downwardAcceleration: Float = 0
    
    // Jump
    //    var controllerJump: Bool = false
    var jumpState: Int = 0
    var groundNode: SCNNode?
    //    var groundNodeLastPosition = SIMD3<Float>.zero
    
    // Direction
    var previousUpdateTime: TimeInterval = 0
  //  var controllerDirection = SIMD2<Float>.zero
    
    
    // actions
    var isJump: Bool = false
    var direction = SIMD2<Float>()
//    var physicsWorld: SCNPhysicsWorld?
    
    var isBurning: Bool = false
    
    var isWalking: Bool = false {
        didSet {
            if oldValue != isWalking {
                // Update node animation.
//                if isWalking {
//                    model.animationPlayer(forKey: "walk")?.play()
//                } else {
//                    model.animationPlayer(forKey: "walk")?.stop(withBlendOutDuration: 0.2)
//                }
            }
        }
    }
    
    override init() {
        super.init()
        
        
       let scene = SCNScene(named: "art.scnassets/character/max.scn")!
      //  let scene = SCNScene(named: "cube.scn")!
        
        
        self.characterNode = scene.rootNode.childNodes[0]
        
        
        
        loadAnimations()
    }
}
