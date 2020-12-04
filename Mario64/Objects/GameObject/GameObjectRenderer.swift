//
//  GameObjectRenderer.swift
//  TestSwift
//
//  Created by aship on 2020/12/02.
//

import SceneKit

extension GameObject {
    func renderer(_ renderer: SCNSceneRenderer,
                  updateAtTime time: TimeInterval) {
        
        
     //   print("3333333")
        
        //renderer.showsStatistics = self.showsStatistics
        //renderer.debugOptions = self.debugOptions
        
    //    print("self.character.potision   \(self.character.characterNode.position)")
        // update characters
        self.character.update(atTime: time, with: renderer)
        
    }
}
