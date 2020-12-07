//
//  GameSceneField.swift
//  Mario64
//
//  Created by aship on 2020/12/05.
//

import SceneKit

extension GameScene {
    func addField() {
        let scene = SCNScene(named: "art.scnassets/field.scn")!
        
        for childNode in scene.rootNode.childNodes {
            childNode.physicsBody = SCNPhysicsBody(type: .static,
                                                    shape: nil)
            
            self.rootNode.addChildNode(childNode)
        }
    }
    
    func addFloor() {
        let floorGeo = SCNFloor()
        let floorNode = SCNNode(geometry: floorGeo)
        floorGeo.firstMaterial?.diffuse.contents = UIColor.green
        //   floorNode.position.y = -1
        floorNode.physicsBody = SCNPhysicsBody(type: .static,
                                               shape: nil)
        self.rootNode.addChildNode(floorNode)
    }
    
    //    required init?(coder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    
    func addIsland() {
        let scene = SCNScene(named: "art.scnassets/scene.scn")!
        
        let childNode = scene.rootNode.childNodes[0]
        
        self.rootNode.addChildNode(childNode)
    }
}
