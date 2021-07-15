//
//  GameScene.swift
//  Snake
//
//  Created by Andrey Leganov on 7/9/21.
//

import SpriteKit
import GameplayKit

struct CollisionCategory {
    
    static let Snake: UInt32 = 0x1 << 0 // 0001 1
    static let SnakeHead: UInt32 = 0x1 << 1 // 0010 2
    static let Apple: UInt32 = 0x1 << 2 // 0100 4
    static let EdgeBody: UInt32 = 0x1 << 3 // 1000 8
}

class GameScene: SKScene {

    var snake: Snake?
    var apple: Apple?
    
    override func didMove(to view: SKView) {

        backgroundColor = SKColor.lightGray
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsBody?.allowsRotation = false
        view.showsPhysics = true
        
        let counterClockWiseButton = SKShapeNode()
        counterClockWiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        counterClockWiseButton.position = CGPoint(x: view.scene!.frame.minX + 30, y: view.scene!.frame.minY + 30)
        counterClockWiseButton.fillColor = .gray
        counterClockWiseButton.strokeColor = .gray
        counterClockWiseButton.lineWidth = 10
        counterClockWiseButton.name = "counterClockWiseButton"
        addChild(counterClockWiseButton)
        
        let clockWiseButton = SKShapeNode()
        clockWiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        clockWiseButton.position = CGPoint(x: view.scene!.frame.maxX - 80, y: view.scene!.frame.minY + 30)
        clockWiseButton.fillColor = .gray
        clockWiseButton.strokeColor = .gray
        clockWiseButton.lineWidth = 10
        clockWiseButton.name = "clockWiseButton"
        addChild(clockWiseButton)
        
        createApple()
        
        createSnake()
        
        self.physicsWorld.contactDelegate = self
        
        self.physicsBody?.categoryBitMask = CollisionCategory.EdgeBody
        self.physicsBody?.collisionBitMask = CollisionCategory.Snake | CollisionCategory.SnakeHead
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            guard let touchNode = self.atPoint(touchLocation) as? SKShapeNode,
                  touchNode.name == "counterClockWiseButton" || touchNode.name == "clockWiseButton" else {
                return
            }
            touchNode.fillColor = .green
            
            if touchNode.name == "counterClockWiseButton" {
                snake!.moveCounterClockWise()
            }
            
            if touchNode.name == "clockWiseButton" {
                snake!.moveClockWise()
            }
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            guard let touchNode = self.atPoint(touchLocation) as? SKShapeNode,
                  touchNode.name == "counterClockWiseButton" || touchNode.name == "clockWiseButton" else {
                return
            }
            touchNode.fillColor = .gray
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        snake!.move()
    }
    
    func createApple() {
        let randomX = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxX - 5)))
        let randonY = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxY - 5)))
        
        apple = Apple(position: CGPoint(x: randomX, y: randonY))
        
        addChild(apple!)
    }
    
    func createSnake() {
        snake = Snake(atPoint: CGPoint(x: view!.scene!.frame.midX, y: view!.scene!.frame.midY))
        addChild(snake!)
    }
}

extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        let bodies = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        // 8
        
        let collisionObject = bodies - CollisionCategory.SnakeHead
        // 2
        
        switch collisionObject {
        case CollisionCategory.Apple :
            let apple = contact.bodyA.node is Apple ? contact.bodyA.node : contact.bodyB.node
            snake?.addBodyPart()
            apple?.removeFromParent()
            createApple()
        case CollisionCategory.EdgeBody:
//            break
            // homework
            snake!.deleteAllBody()
            createSnake()
            
            apple?.removeFromParent()
            createApple()
        default:
            break
        }
    }
}
