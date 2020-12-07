//
//  GaneScene.swift
//  TestSpriteKit
//
//  Created by aship on 2020/10/05.
//

import SceneKit

class GameScene: SCNScene {
    var gameObject: GameObject!
    var cameraNode = SCNNode()
    
    var timer: Timer?
    
    let initialPosition = SIMD3<Float>(0.1, 9.2, 0)
    
    init(object: GameObject) {
        super.init()
        
        self.gameObject = object
        
        self.background.contents = UIColor.black
        
        // addIsland()
     //   addFloor()
        addField()
        addFox()
        
      //  addCube()
        
        addCamera()
        
        //  addCupsule()
        
        addLight()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCube() {
        
        let scene = SCNScene(named: "art.scnassets/cube.scn")!
        //  let scene = SCNScene(named: "cube.scn")!
        
        let node = scene.rootNode.childNodes[0]
        
        node.position =  SCNVector3(x: 10.0,
                                    y: 0.0,
                                    z: 3.0)
        
        node.scale = SCNVector3(x: 10.0,
                                y: 10.0,
                                z: 10.0)
        
        node.physicsBody = SCNPhysicsBody(type: .static,
                                           shape: nil)
        
        self.rootNode.addChildNode(node)
        //   self.characterNode =
        
        
        
    }
    
    func addLight() {
        let omniLight = SCNNode()
        omniLight.light = SCNLight()
    //    omniLight.light?.type = .omni
        omniLight.light?.type = .ambient
        omniLight.position = SCNVector3(10,
                                        10,
                                        50)
        self.rootNode.addChildNode(omniLight)
    }
    

}
