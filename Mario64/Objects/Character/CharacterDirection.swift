//
//  CharacterDirection.swift
//  TestSwift
//
//  Created by aship on 2020/12/04.
//

import SceneKit

extension Character {
    func characterDirection(withPointOfView pointOfView: SCNNode?) -> SIMD3<Float> {
        let controllerDir = self.direction
        
        if controllerDir.allZero() {
            return SIMD3<Float>.zero
        }
        
        var directionWorld = SIMD3<Float>.zero
        
        if let pov = pointOfView {
            let p1 = pov.presentation.simdConvertPosition(SIMD3<Float>(controllerDir.x, 0.0, controllerDir.y), to: nil)
            let p0 = pov.presentation.simdConvertPosition(SIMD3<Float>.zero, to: nil)
            
            directionWorld = p1 - p0
            directionWorld.y = 0
            
            if simd_any(directionWorld != SIMD3<Float>.zero) {
                let minControllerSpeedFactor = Float(0.2)
                let maxControllerSpeedFactor = Float(1.0)
                let speed = simd_length(controllerDir) * (maxControllerSpeedFactor - minControllerSpeedFactor) + minControllerSpeedFactor
                directionWorld = speed * simd_normalize(directionWorld)
            }
        }
        
        return directionWorld
    }
}
