//
//  GameScene.swift
//  gameiOS-Fish
//
//  Created by Simran Kaur Bal on 2019-10-18.
//  Copyright © 2019 Simran Kaur Bal. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene
{
    
    var sky:SKSpriteNode!
    var count:Int! = 0
    var bush:SKSpriteNode!
    var water:SKSpriteNode!
    var flag:Bool = false
    var hanger:SKSpriteNode!
    var flagHanger:Bool = false
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView)
    {
        // movement of bushes
        let moveAction1 = SKAction.moveBy(x: 0, y: 10, duration: 1)
        let moveAction2 = SKAction.moveBy(x: 0, y: -20, duration: 1)
        
        self.enumerateChildNodes(withName: "bush")
        {
            (point, stop) in
            self.bush = point as! SKSpriteNode
            let waterAnimation = SKAction.sequence(
                       [moveAction1,moveAction2,moveAction1]
                   )
                  
                   let waterforever = SKAction.repeatForever(waterAnimation)
                   self.bush.run(waterforever)
        }
        
    }
        
    // array for fishes
        var fish:[SKSpriteNode] = []
        func spwanfish()
        {
            count = count + 1
            let randomFishIndex = Int(CGFloat.random(in: 1 ... 8))
            let fishs:SKSpriteNode = SKSpriteNode(imageNamed: "fish\(randomFishIndex)")
            
            count = count + 1
            
            fishs.name = "fishnum\(count)"
            print("fishnum\(count)")
                
            // generating random fishes
            let randomXPos = CGFloat.random(in: -100 ... 0)
            let randomYPos = CGFloat.random(in: 0 ... size.height/2)
            fishs.position = CGPoint(x:randomXPos, y:randomYPos)
            print("fish\([randomFishIndex])")
            
            // adding fish to the screen
            addChild(fishs)
            
            // adding fish to the array

            self.fish.append(fishs)
            
        }
    
    override func update(_ currentTime: TimeInterval) {
//        // Called before each frame is rendered
        count = count + 1 ;
        if(count % 250 == 0)
        {
            spwanfish()
        }

        // movement of fish in x direction.
        
        for point in fish {
            point.position.x += 1
        }
        
        // speed og hanger
        if(flag == true) {
            if(hanger.position.y>0) {
                self.hanger.position.y -= 1
            }
            
        }
        
        // hanger attaches fishes
//        for point in fish
//        {
//            if
//                (hanger.frame.intersects(point.frame))
//            {
//                if(hanger.position.y<size.height/2)
//                {
//                    flagHanger = true
//                    flag = false
//                }
//            }
//        }
}
}
