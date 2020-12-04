//
//  CharacterUpdate.swift
//  TestSwift
//
//  Created by aship on 2020/12/02.
//

import SceneKit

var previousJumpState = 0

extension Character {
    func update(atTime time: TimeInterval,
                with renderer: SCNSceneRenderer) {
        
        
        var characterVelocity = SIMD3<Float>.zero
        
        // setup
        var groundMove = SIMD3<Float>.zero
        
        // did the ground moved?
        //        if groundNode != nil {
        //            let groundPosition = groundNode!.simdWorldPosition
        //            groundMove = groundPosition - groundNodeLastPosition
        //        }
        
        characterVelocity = SIMD3<Float>(groundMove.x, 0, groundMove.z)
        
        let direction = characterDirection(withPointOfView:renderer.pointOfView)
        
        if previousUpdateTime == 0.0 {
            previousUpdateTime = time
        }
        
        let deltaTime = time - previousUpdateTime
        
        let virtualFrameCount = Int(deltaTime / (1 / 60.0))
        
        // move
        if !direction.allZero() {
            //            characterVelocity = direction * Float(characterSpeed)
            //            var runModifier = Float(1.0)
            //            #if os(OSX)
            //            if NSEvent.modifierFlags.contains(.shift) {
            //                runModifier = 2.0
            //            }
            //            #endif
            //            walkSpeed = CGFloat(runModifier * simd_length(direction))
            //
            //            // move character
            //            directionAngle = CGFloat(atan2f(direction.x, direction.z))
            //
            isWalking = true
        } else {
            isWalking = false
        }
        
        // put the character on the ground
        //   let up = SIMD3<Float>(0, 1, 0)
        var wPosition = characterNode.simdWorldPosition
        // gravity
        downwardAcceleration -= Character.gravity
        wPosition.y += downwardAcceleration
        
        let wasTouchingTheGroup = groundNode != nil
        
        var touchesTheGround = true
        let wasBurning = isBurning
        
        
        if jumpState != previousJumpState {
            previousJumpState = jumpState
            print("jumpState  \(jumpState) ")
        }
        
        // jump -------------------------------------------------------------
        if jumpState == 0 {
            if isJump && touchesTheGround {
                downwardAcceleration += Character.jumpImpulse
                jumpState = 1
                
                print("TRY TO JUMPPPP")
                
                //  model.animationPlayer(forKey: "jump")?.play()
                self.characterNode.animationPlayer(forKey: "jump")?.play()
            }
        } else {
            if jumpState == 1 && !isJump {
                jumpState = 2
                print("jumpState: 2")
            }
            
            if downwardAcceleration > 0 {
                for _ in 0..<virtualFrameCount {
                    downwardAcceleration *= jumpState == 1 ? 0.99: 0.2
                }
            }
            
            if touchesTheGround {
                if !wasTouchingTheGroup {
                    //   model.animationPlayer(forKey: "jump")?.stop(withBlendOutDuration: 0.1)
                    
                    // trigger jump particles if not touching lava
                    if isBurning {
                        //    model.childNode(withName: "dustEmitter", recursively: true)?.addParticleSystem(jumpDustParticle)
                    } else {
                        // jump in lava again
                        if wasBurning {
                            //                            let action = SCNAction.playAudio(catchFireSound, waitForCompletion: false)
                            //                            let action2 = SCNAction.playAudio(ouchSound, waitForCompletion: false)
                            //
                            //                            let actionSequense = SCNAction.sequence([action,
                            //                                                                     action2])
                            //                            characterNode.runAction(actionSequense)
                        }
                    }
                }
                
                if !isJump {
                    jumpState = 0
                }
            }
        }
        
        characterVelocity.y += downwardAcceleration
        
        //        if simd_length_squared(characterVelocity) > 10E-4 * 10E-4 {
        ////            let startPosition = characterNode!.presentation.simdWorldPosition + collisionShapeOffsetFromModel
        //
        //            let startPosition = characterNode!.presentation.simdWorldPosition + 10
        //
        //            slideInWorld(fromPosition: startPosition,
        //                         velocity: characterVelocity)
        //        }
        
        //   print("driection \(direction)")
        
        if jumpState == 1 {
            let simdWorldPosition = characterNode!.presentation.simdWorldPosition
            
            var diffY: Float = 0.5
            
            let posX = simdWorldPosition.x
            let posY = simdWorldPosition.y + diffY
            let posZ = simdWorldPosition.z
            
            characterNode!.simdWorldPosition = SIMD3<Float>(posX,
                                                            posY,
                                                            posZ)
        }
        
        if isWalking {
            let simdWorldPosition = characterNode!.presentation.simdWorldPosition
            
            //   var diffY: Float = 0.5
            
            let posX = simdWorldPosition.x + direction.x / 2
            let posY = simdWorldPosition.y + direction.y / 2
            let posZ = simdWorldPosition.z + direction.z / 2
            
            characterNode!.simdWorldPosition = SIMD3<Float>(posX,
                                                            posY,
                                                            posZ)
        }
    }
}
