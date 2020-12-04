//
//  CharacterAnimate.swift
//  TestSwift
//
//  Created by aship on 2020/11/30.
//

import SceneKit

extension Character {
    // MARK: - Animating the character
    class func loadAnimation(fromSceneNamed sceneName: String) -> SCNAnimationPlayer {
        let scene = SCNScene( named: sceneName )!
        // find top level animation
        var animationPlayer: SCNAnimationPlayer! = nil
        scene.rootNode.enumerateChildNodes { (child, stop) in
            if !child.animationKeys.isEmpty {
                animationPlayer = child.animationPlayer(forKey: child.animationKeys[0])
                stop.pointee = true
            }
        }
        return animationPlayer
    }

#if false
    func attack() {
        attackCount += 1
        self.characterNode.animationPlayer(forKey: "spin")?.play()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.attackCount -= 1
        }
        spinParticleAttach.addParticleSystem(spinCircleParticle)
    }
            

    
    func resetCharacterPosition() {
        characterNode.simdPosition = Character.initialPosition
        downwardAcceleration = 0
    }
#endif
}
