//
//  CharacterPhysics.swift
//  TestSwift
//
//  Created by aship on 2020/12/03.
//

import Foundation

import SceneKit

extension Character {
    // MARK: - physics contact
#if false
    func slideInWorld(fromPosition start: SIMD3<Float>, velocity: SIMD3<Float>) {
        let maxSlideIteration: Int = 4
        var iteration = 0
        var stop: Bool = false

        var replacementPoint = start

        var start = start
        var velocity = velocity
        let options: [SCNPhysicsWorld.TestOption: Any] = [
            SCNPhysicsWorld.TestOption.collisionBitMask: Bitmask.collision.rawValue,
            SCNPhysicsWorld.TestOption.searchMode: SCNPhysicsWorld.TestSearchMode.closest]
        while !stop {
            var from = matrix_identity_float4x4
            from.position = start

            var to: matrix_float4x4 = matrix_identity_float4x4
            to.position = start + velocity

            let contacts = physicsWorld!.convexSweepTest(
                with: characterCollisionShape!,
                from: SCNMatrix4(from),
                to: SCNMatrix4(to),
                options: options)
            if !contacts.isEmpty {
                (velocity, start) = handleSlidingAtContact(contacts.first!, position: start, velocity: velocity)
                iteration += 1

                if simd_length_squared(velocity) <= (10E-3 * 10E-3) || iteration >= maxSlideIteration {
                    replacementPoint = start
                    stop = true
                }
            } else {
                replacementPoint = start + velocity
                stop = true
            }
        }
        characterNode!.simdWorldPosition = replacementPoint - collisionShapeOffsetFromModel
    }
#endif
}
