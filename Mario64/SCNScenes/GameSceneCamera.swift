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
        
        let cameraPosY = 2
        
        self.cameraNode.position = SCNVector3(0,
                                              cameraPosY,
                                              3)
        
        self.rootNode.addChildNode(self.cameraNode)
        
        
        // look at constraint
        let foxNode = self.gameObject.character.characterNode
        
        let lookAtConstraint = SCNLookAtConstraint(target: foxNode)
        lookAtConstraint.isGimbalLockEnabled = true // keep horizon horizontal
        
        let distanceConstraint = SCNDistanceConstraint(target: foxNode)
        distanceConstraint.minimumDistance = 2
        distanceConstraint.maximumDistance = 2
        
        let positionConstraint = SCNTransformConstraint.positionConstraint(
            inWorldSpace: true,
            with: {(_ node: SCNNode, _ position: SCNVector3) -> SCNVector3 in
//                guard let strongSelf = weakSelf
//                else { return position }
                
                var position = SIMD3<Float>(position)
                position.y = Float(cameraPosY) // strongSelf.character!.baseAltitude + desiredAltitude
                
                return SCNVector3(position)
            }
        )

        
        self.cameraNode.constraints = [lookAtConstraint, distanceConstraint, positionConstraint]
        
        
        
        print("TRY TO SET POINTOVEIW")
        self.gameObject.pointOfView = self.cameraNode
    }
    
    func rorateCamera() {
        //        self.cameraNode.rotation = SCNVector4(1,
        //                                              0,
        //                                              0,
        //                                              0.02 * Float.pi)
        
        
        
        //        let action = SCNAction.rotateBy(x: 0.0,
        //                                        y: 0.2,
        //                                        z: 0.0,
        //                                        duration: 2)
        
        
        let simdWorldPosition = self.gameObject.character.characterNode!.presentation.simdWorldPosition
        let posX = simdWorldPosition.x
        let posY = simdWorldPosition.y
        let posZ = simdWorldPosition.z
        let aroundPos = SCNVector3(x: posX,
                                   y: posY,
                                   z: posZ)
        
        let angle: CGFloat = CGFloat(Float.pi / 2)

        
        

        
        
        
        
        //        let camera = SCNCamera()
        //        camera.usesOrthographicProjection = true
        //        camera.orthographicScale = 9
        //        camera.zNear = 0
        //        camera.zFar = 100
        //        let cameraNode = SCNNode()
        //        cameraNode.position = SCNVector3(x: 0, y: 0, z: 50)
        //        cameraNode.camera = camera
        //        let cameraOrbit = SCNNode()
        //        cameraOrbit.addChildNode(cameraNode)
        //        cubeScene.rootNode.addChildNode(cameraOrbit)
        
        // rotate it (I've left out some animation code here to show just the rotation)
        //        cameraOrbit.eulerAngles.x -= CGFloat(M_PI_4)
        //        cameraOrbit.eulerAngles.y -= CGFloat(M_PI_4*3)
        
        
        
        // ベクトルの差を求め
        let cameraPos: simd_float3 = SIMD3<Float>(self.cameraNode.position)
        let characterPos: simd_float3 = SIMD3<Float>(self.gameObject.character.characterNode.position)
        
        var diffVector = cameraPos - characterPos
        
        print("diffVector   \(diffVector) ")
        // y の値を 0 にし
        diffVector.y = 0
        // y軸周りに 90度回転したベクトルを求めて、それを move by
        //   diffVector.rotate
        
        print("diffVector after y0   \(diffVector) ")
        
        // 逆時計回りに90度回転させる
        let axis = SIMD3<Float>(0.0, 1.0, 0.0)
        let quaternion = simd_quatf(angle: .pi / 2,
                                    axis: simd_normalize(axis))
        
        //   ship.simdLocalRotate(by: quaternion)
        
        let rotatedVector = quaternion.act(diffVector)
        
        print("rotatedVector  \(rotatedVector) ")
        
        
        let moveX: CGFloat = CGFloat(rotatedVector.x)
        let moveY: CGFloat = CGFloat(rotatedVector.y)
        let moveZ: CGFloat = CGFloat(rotatedVector.z)
        
        let action = SCNAction.moveBy(x: moveX,
                                      y: moveY,
                                      z: moveZ,
                                      duration: 1)
        
        self.cameraNode.runAction(action)
    }
}
