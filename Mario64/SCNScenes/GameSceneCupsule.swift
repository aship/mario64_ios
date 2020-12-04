//
//  GameSceneCupsule.swift
//  TestSwift
//
//  Created by aship on 2020/12/03.
//

import SceneKit

extension GameScene {
    @objc func addCupsule() {
        let cg = SCNCapsule(capRadius: 2.0,
                            height: 6.0)
        cg.firstMaterial?.diffuse.contents = UIColor.red
        cg.firstMaterial?.specular.contents = UIColor.white
        
        let cn = SCNNode(geometry: cg)
        cn.position = SCNVector3(x: 0.0,
                                 y: 20.0,
                                 z: 10.0)
        cn.rotation = SCNVector4(x: 0,
                                 y: 0,
                                 z: 1,
                                 w: Float.pi / 6.0)
        
        cn.physicsBody = SCNPhysicsBody(type: .dynamic,
                                        shape: nil)
        
     //   cn.physicsBody?.isAffectedByGravity = false
        
        self.rootNode.addChildNode(cn)
    }
}
