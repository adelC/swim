//
//  SnakeAgent.swift
//  CSAgent
//
//  Created by Adel Chaibi on 02/03/2022.
//

import SpriteKit




class SnakeAgent: Agent{
    
   //public static var head: SKSpriteNode!
    var head: SKSpriteNode!
    //var body: SKShapeNode!
    var directions =  ["left", "right", "up", "down"]
    var currentDirection: String!
    var body:[SKShapeNode] = []
    let ONE_STEP:CGFloat = 30
    
    override init() {
        
        //head
        head  = SKSpriteNode(imageNamed: "Snake")
        head.physicsBody = SKPhysicsBody(texture: head.texture!, size: head.texture!.size())
        head.physicsBody?.isDynamic = false
        head.size.width = head.size.width*1/24
        head.size.height = head.size.height*1/24
        currentDirection = "down"
        
        //body
        body.append(SKShapeNode(rectOf: CGSize(width: 22, height: 22)))
        body[0].fillColor = SKColor.orange
        body[0].alpha = 1.0
    }
    
   
    
    @objc func moveSnake(){
        
        var newDirection: String? = ""
        switch currentDirection {
            
        case "left":
          
            newDirection = ["left", "up", "down"].randomElement()
            
            if newDirection == "left" {
                for i in 1...body.count-1 {
                    body[i].run(SKAction.move(to:body[i-1].position , duration: 1/4 ))
                }
                
                body[0].run(SKAction.move(to:head.position , duration: 1/4 ))
                
                let newX = head.position.x-ONE_STEP < ONE_STEP ? ONE_STEP:head.position.x-ONE_STEP
                head.run(SKAction.move(to:CGPoint(x: newX, y: head.position.y), duration: 1/4))
                currentDirection = newDirection
            }
            else if newDirection == "up" {
                
                for i in 1...body.count-1 {
                    body[i].run(SKAction.move(to:body[i-1].position , duration: 1/4 ))
                }
                
                body[0].run(SKAction.move(to:head.position , duration: 1/4 ))
                head.zRotation = CGFloat.pi
                let newY = head.position.y+ONE_STEP > 480 ? 480:head.position.y+ONE_STEP
                head.run(SKAction.move(to:CGPoint(x: head.position.x, y: newY), duration: 1/4))
                currentDirection = newDirection
                
            }
            else if newDirection == "down" {
                
                for i in 1...body.count-1 {
                    body[i].run(SKAction.move(to:body[i-1].position , duration: 1/4 ))
                }
                
                body[0].run(SKAction.move(to:head.position , duration: 1/4 ))
                head.zRotation = 2*CGFloat.pi
                let newY = head.position.y-ONE_STEP < ONE_STEP ? ONE_STEP:head.position.y-ONE_STEP
                head.run(SKAction.move(to:CGPoint(x: head.position.x, y: newY) , duration: 1/4))
                currentDirection = newDirection
            }
            
        case "right":
            
            newDirection = ["right", "up", "down"].randomElement()
            
            if newDirection == "right" {
                
                for i in 1...body.count-1 {
                    body[i].run(SKAction.move(to:body[i-1].position , duration: 1/4 ))
                }
                
                body[0].run(SKAction.move(to:head.position , duration: 1/4 ))
                let newX = head.position.x+ONE_STEP > 480 ? 480:head.position.x+ONE_STEP
                head.run(SKAction.move(to:CGPoint(x: newX, y: head.position.y) , duration: 1/4 ))
                currentDirection = newDirection
            }
            
            else if newDirection == "up" {
                
                for i in 1...body.count-1 {
                    body[i].run(SKAction.move(to:body[i-1].position , duration: 1/4 ))
                }
                
                body[0].run(SKAction.move(to:head.position , duration: 1/4 ))
                head.zRotation = CGFloat.pi
                let newY = head.position.y+ONE_STEP > 480 ? 480:head.position.y+ONE_STEP
                head.run(SKAction.move(to:CGPoint(x: head.position.x, y: newY) , duration: 1/4))
                currentDirection = newDirection
                
            }
            else if newDirection == "down" {
                
                for i in 1...body.count-1 {
                    body[i].run(SKAction.move(to:body[i-1].position , duration: 1/4 ))
                }
                
                body[0].run(SKAction.move(to:head.position , duration: 1/4 ))
                head.zRotation = 2*CGFloat.pi
                let newY = head.position.y-ONE_STEP < ONE_STEP ? ONE_STEP:head.position.y-ONE_STEP
                head.run(SKAction.move(to:CGPoint(x: head.position.x, y: newY) , duration: 1/4 ))
                currentDirection = newDirection
            }
            
        case "up":
           
            newDirection = ["up", "left", "right"].randomElement()
            
            if newDirection == "up" {
                
                for i in 1...body.count-1 {
                    body[i].run(SKAction.move(to:body[i-1].position , duration: 1/4 ))
                }
                
                body[0].run(SKAction.move(to:head.position , duration: 1/4 ))
                let newY = head.position.y+ONE_STEP > 480 ? 480:head.position.y+ONE_STEP
                head.run(SKAction.move(to:CGPoint(x: head.position.x, y: newY) , duration: 1/4 ))
                currentDirection = newDirection
            }
            else if newDirection == "left" {
                
                for i in 1...body.count-1 {
                    body[i].run(SKAction.move(to:body[i-1].position , duration: 1/4 ))
                }
                
                body[0].run(SKAction.move(to:head.position , duration: 1/4 ))
                head.zRotation = -CGFloat.pi/2
                let newX = head.position.x-ONE_STEP < ONE_STEP ? ONE_STEP:head.position.x-ONE_STEP
                head.run(SKAction.move(to:CGPoint(x: newX, y: head.position.y) , duration: 1/4 ))
                currentDirection = newDirection
            }
            else if newDirection == "right" {
                
                for i in 1...body.count-1 {
                    body[i].run(SKAction.move(to:body[i-1].position , duration: 1/4 ))
                }
                body[0].run(SKAction.move(to:head.position , duration: 1/4 ))
                head.zRotation = CGFloat.pi/2
                let newX = head.position.x+ONE_STEP > 480 ? 480:head.position.x+ONE_STEP
                head.run(SKAction.move(to:CGPoint(x: newX, y: head.position.y) , duration: 1/4 ))
                currentDirection = newDirection
            }
            
        case "down":
           
            newDirection = ["down", "left", "right"].randomElement()
            
            if newDirection == "down" {
                
                for i in 1...body.count-1 {
                    body[i].run(SKAction.move(to:body[i-1].position , duration: 1/4 ))
                }
                body[0].run(SKAction.move(to:head.position , duration: 1/4 ))
                let newY = head.position.y-ONE_STEP < ONE_STEP ? ONE_STEP:head.position.y-ONE_STEP
                head.run(SKAction.move(to:CGPoint(x: head.position.x, y: newY) , duration: 1/4 ))
                currentDirection = newDirection
            }
            else if newDirection == "left" {
                
                for i in 1...body.count-1 {
                    body[i].run(SKAction.move(to:body[i-1].position , duration: 1/4 ))
                }
                
                body[0].run(SKAction.move(to:head.position , duration: 1/4 ))
                head.zRotation = -CGFloat.pi/2
                let newX = head.position.x-ONE_STEP < ONE_STEP ? ONE_STEP:head.position.x-ONE_STEP
                head.run(SKAction.move(to:CGPoint(x: newX, y: head.position.y) , duration: 1/4 ))
                currentDirection = newDirection
            }
            else if newDirection == "right" {
                
                for i in 1...body.count-1 {
                    body[i].run(SKAction.move(to:body[i-1].position , duration: 1/4 ))
                }
                
                body[0].run(SKAction.move(to:head.position , duration: 1/4 ))
                head.zRotation = CGFloat.pi/2
                let newX = head.position.x+ONE_STEP > 480 ? 480:head.position.x+ONE_STEP
                head.run(SKAction.move(to:CGPoint(x: newX, y: head.position.y) , duration: 1/4 ))
                currentDirection = newDirection
            }
            
        default:
            print("Ok !")
        }
    }
}
