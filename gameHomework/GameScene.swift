//
//  GameScene.swift
//  flayingBird
//
//  Created by Defne Çetiner on 20.03.2023.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var bird = SKSpriteNode()
    var ice1 = SKSpriteNode()
    var ice2 = SKSpriteNode()
    var ice3 = SKSpriteNode()
    var ice4 = SKSpriteNode()
    var ice5 = SKSpriteNode()
    var ice6 = SKSpriteNode()
    var ice7 = SKSpriteNode()
    var nameLabel = SKLabelNode()
    var scoreLabel = SKLabelNode()
    
    var gameStarted = false
    var originalPozition: CGPoint?
    var score = 0
  
    
    
    
    enum colliderType: UInt32 {
        case Bird = 1
        case Ice = 2
        
    }
    
    override func didMove(to view: SKView) {
 
        
        
        //Physics body
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame) // total bir çerçeve dünyası yani kuş yere düşer kaybolmaz
        self.scene?.scaleMode = .aspectFit
        self.physicsWorld.contactDelegate = self
        
        // --Label--
        
        nameLabel = childNode(withName: "nameLabel") as! SKLabelNode
        scoreLabel = childNode(withName: "scoreLabel") as! SKLabelNode
        
        
        
        // --BİRD--
        bird = childNode(withName: "bird") as! SKSpriteNode
        let birdTexture = SKTexture(imageNamed: "bird")
        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height / 15)
        bird = childNode(withName: "bird") as! SKSpriteNode
        bird.physicsBody?.affectedByGravity = false  // yer çekimi
        bird.physicsBody?.isDynamic = true // fiziksel similasyonlardan etkilenicek mi
        bird.physicsBody?.mass = 0.20 // kütlesi
        originalPozition = bird.position // kuş nerdeyse oradan başlıcak
        bird.physicsBody?.contactTestBitMask = colliderType.Bird.rawValue
        bird.physicsBody?.collisionBitMask = colliderType.Ice.rawValue
        
        
       
        // -- ICE --
        let iceTexture = SKTexture(imageNamed: "ice")
        let size = CGSize(width: iceTexture.size().width / 16, height: iceTexture.size().height / 16)
        ice1 = childNode(withName: "ice1") as! SKSpriteNode
        ice1.physicsBody = SKPhysicsBody(rectangleOf: size)
        ice1.physicsBody?.isDynamic = true
        ice1.physicsBody?.affectedByGravity = true
        ice1.physicsBody?.allowsRotation = true
        ice1.physicsBody?.mass = 0.7
        ice1.physicsBody?.collisionBitMask = colliderType.Bird.rawValue
        
        ice2 = childNode(withName: "ice2") as! SKSpriteNode
        ice2.physicsBody = SKPhysicsBody(rectangleOf: size)
        ice2.physicsBody?.isDynamic = true
        ice2.physicsBody?.affectedByGravity = true
        ice2.physicsBody?.allowsRotation = true
        ice2.physicsBody?.mass = 0.7
        ice2.physicsBody?.collisionBitMask = colliderType.Bird.rawValue
        
        
        ice3 = childNode(withName: "ice3") as! SKSpriteNode
        ice3.physicsBody = SKPhysicsBody(rectangleOf: size)
        ice3.physicsBody?.isDynamic = true
        ice3.physicsBody?.affectedByGravity = true
        ice3.physicsBody?.allowsRotation = true
        ice3.physicsBody?.mass = 0.7
        ice3.physicsBody?.collisionBitMask = colliderType.Bird.rawValue
        
       
        ice4 = childNode(withName: "ice4") as! SKSpriteNode
        ice4.physicsBody = SKPhysicsBody(rectangleOf: size)
        ice4.physicsBody?.isDynamic = true
        ice4.physicsBody?.affectedByGravity = true
        ice4.physicsBody?.allowsRotation = true
        ice4.physicsBody?.mass = 0.7
        ice4.physicsBody?.collisionBitMask = colliderType.Bird.rawValue
        
      
        ice5 = childNode(withName: "ice5") as! SKSpriteNode
        ice5.physicsBody = SKPhysicsBody(rectangleOf: size)
        ice5.physicsBody?.isDynamic = true
        ice5.physicsBody?.affectedByGravity = true
        ice5.physicsBody?.allowsRotation = true
        ice5.physicsBody?.mass = 0.7
        ice5.physicsBody?.collisionBitMask = colliderType.Bird.rawValue
       
        ice6 = childNode(withName: "ice6") as! SKSpriteNode
        ice6.physicsBody = SKPhysicsBody(rectangleOf: size)
        ice6.physicsBody?.isDynamic = true
        ice6.physicsBody?.affectedByGravity = true
        ice6.physicsBody?.allowsRotation = true
        ice6.physicsBody?.mass = 0.7
        ice6.physicsBody?.collisionBitMask = colliderType.Bird.rawValue
        
        ice7 = childNode(withName: "ice7") as! SKSpriteNode
        ice7.physicsBody = SKPhysicsBody(rectangleOf: size)
        ice7.physicsBody?.isDynamic = true
        ice7.physicsBody?.affectedByGravity = true
        ice7.physicsBody?.allowsRotation = true
        ice7.physicsBody?.mass = 0.7
        ice7.physicsBody?.collisionBitMask = colliderType.Bird.rawValue
        
    }
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.collisionBitMask == colliderType.Bird.rawValue || contact.bodyB.collisionBitMask == colliderType.Bird.rawValue {
            score += 1
            scoreLabel.text = String(score)
            
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
     //   self.viewController?.performSegue(withIdentifier: "toGo", sender: nil)
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                                bird.position = touchLocation
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                                bird.position = touchLocation
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if gameStarted == false {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                               let dx = -(touchLocation.x - originalPozition!.x)
                               let dy = -(touchLocation.y - originalPozition!.y)
                                
                               let impulse = CGVector(dx: dx, dy: dy)
                                bird.physicsBody?.applyImpulse(impulse)
                                bird.physicsBody?.affectedByGravity = true
                                
                                gameStarted = true
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval){
        if let birdPhysicsBody = bird.physicsBody {
            if birdPhysicsBody.velocity.dx <= 0.1 && birdPhysicsBody.velocity.dy <= 0.1 && birdPhysicsBody.angularVelocity <= 0.1 && gameStarted == true {
                
                bird.physicsBody?.affectedByGravity = false
                bird.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                bird.physicsBody?.angularVelocity = 0
                bird.zPosition = 1
                bird.position = originalPozition!
                
                score = 0
                scoreLabel.text = String(score)
                gameStarted = false
            }
        }
    }
}
