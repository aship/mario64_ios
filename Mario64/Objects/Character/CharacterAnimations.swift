//
//  CharacterAnimations.swift
//  TestSwift
//
//  Created by aship on 2020/12/02.
//

import SceneKit

extension Character {
    func loadAnimations() {
        let idleAnimation = Character.loadAnimation(fromSceneNamed: "art.scnassets/character/max_idle.scn")
        self.characterNode.addAnimationPlayer(idleAnimation, forKey: "idle")
        idleAnimation.play()
   
#if false
        let walkAnimation = Character.loadAnimation(fromSceneNamed: "art.scnassets/character/max_walk.scn")
        walkAnimation.speed = Character.speedFactor
        walkAnimation.stop()
        
        if Character.enableFootStepSound {
            walkAnimation.animation.animationEvents = [
                SCNAnimationEvent(keyTime: 0.1, block: { _, _, _ in self.playFootStep() }),
                SCNAnimationEvent(keyTime: 0.6, block: { _, _, _ in self.playFootStep() })
            ]
        }
        self.characterNode.addAnimationPlayer(walkAnimation, forKey: "walk")
#endif

        let jumpAnimation = Character.loadAnimation(fromSceneNamed: "art.scnassets/character/max_jump.scn")
        jumpAnimation.animation.isRemovedOnCompletion = false
        jumpAnimation.stop()
        jumpAnimation.animation.animationEvents = [SCNAnimationEvent(keyTime: 0, block: { _, _, _ in
         //   self.playJumpSound()
            
        })]
        self.characterNode.addAnimationPlayer(jumpAnimation, forKey: "jump")




#if false
        let spinAnimation = Character.loadAnimation(fromSceneNamed: "art.scnassets/character/max_spin.scn")
        spinAnimation.animation.isRemovedOnCompletion = false
        spinAnimation.speed = 1.5
        spinAnimation.stop()
        spinAnimation.animation.animationEvents = [SCNAnimationEvent(keyTime: 0, block: { _, _, _ in self.playAttackSound() })]
        self.characterNode!.addAnimationPlayer(spinAnimation, forKey: "spin")
#endif
    }
}
