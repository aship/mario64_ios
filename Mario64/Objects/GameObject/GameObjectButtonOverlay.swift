//
//  GameObjectButtonOverlay.swift
//  TestSwift
//
//  Created by aship on 2020/11/22.
//

extension GameObject {
    // MARK: - ButtonOverlayDelegate
    
    func willPress(_ button: ButtonOverlay) {
        print("WillPress")
        
        if button == self.skScene.buttonA {
            controllerJump(true)
            
            
//            let simdWorldPosition = self.character.characterNode!.simdWorldPosition
//            
//            self.character.characterNode!.simdWorldPosition = SIMD3<Float>(simdWorldPosition.x,
//                                                            simdWorldPosition.y + 3,
//                                                            simdWorldPosition.z)
        }
        
        if button == self.skScene.buttonB {
           // controllerAttack()
            
            self.scnScene.rorateCamera()
  
           
        }
    }
    
    func didPress(_ button: ButtonOverlay) {
        print("DidPress")
        
        if button == self.skScene.buttonA {
            controllerJump(false)
        }
    }
    
    // MARK: - Controlling the character
    
    func controllerJump(_ controllerJump: Bool) {
        self.character.isJump = controllerJump
    }
    
    func controllerAttack() {
        //        if !self.character!.isAttacking {
        //            self.character!.attack()
        //        }
    }
}
