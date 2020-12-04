//
//  GameSceneCamera.swift
//  TestSwift
//
//  Created by aship on 2020/12/03.
//

import SceneKit

extension GameScene {
    func addCamera() {
        self.cameraNode.camera = SCNCamera()
        self.cameraNode.position = SCNVector3(0,
                                         10,
                                         25)
        
        self.rootNode.addChildNode(self.cameraNode)
        
        print("TRY TO SET POINTOVEIW")
        self.gameObject.pointOfView = self.cameraNode
    }
    
    func rorateCamera() {
//        self.cameraNode.rotation = SCNVector4(1,
//                                              0,
//                                              0,
//                                              0.02 * Float.pi)
        
        // look at constraint
        let foxNode = self.gameObject.character.characterNode
        
        let lookAtConstraint = SCNLookAtConstraint(target: foxNode)
        lookAtConstraint.isGimbalLockEnabled = true // keep horizon horizontal
        
        self.cameraNode.constraints = [lookAtConstraint]
        
        
//        let action = SCNAction.rotateBy(x: 0.0,
//                                        y: 0.2,
//                                        z: 0.0,
//                                        duration: 2)
        let action = SCNAction.moveBy(x: 2,
                                      y: 0,
                                      z: 0,
                                      duration: 1)
        self.cameraNode.runAction(action)
        

        
      //  self.cameraNode.rotation = SCNVector4(1, 0, 0, 0.25 * Float.pi)
    }
}
