//
//  GameSceneFox.swift
//  TestSwift
//
//  Created by aship on 2020/12/02.
//

import SceneKit

extension GameScene {
    func addFox() {
        
        self.gameObject.character.characterNode.scale = SCNVector3(x: 1.0,
                                                                   y: 1.0,
                                                                   z: 1.0)
        
        self.gameObject.character.characterNode.simdPosition = self.initialPosition
        
        let physicsBody = SCNPhysicsBody(type: .dynamic,
                                         shape: nil)
        
        //    physicsBody.isAffectedByGravity = false
        
        self.gameObject.character.characterNode.physicsBody = physicsBody
        
        
        //      SCNVector3(x: 0.0,
        //                                y: 0.0,
        //                              z: 0.0)
        
        self.rootNode.addChildNode(self.gameObject.character.characterNode)
    }
}
