//
//  GameScene.swift
//  CSAgent
//
//  Created by Adel Chaibi on 26/02/2022.
//
import UIKit
import SpriteKit
import SwiftUI
import CoreMotion

let ONE_STEP:CGFloat = 30

class SnakeScene : SKScene, SKPhysicsContactDelegate {
    
    private var env: SnakeEnv!
    private var timer: Timer?
    internal var timeOfLastMove = 0.0
    
    override func didMove(to view: SKView) {
        
        env = SnakeEnv(scene: self)
        env.start()
        
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        
        
       // timer = Timer.scheduledTimer(timeInterval: 0.35, target: self, selector: #selector(moveSnake), userInfo: nil, repeats: true)
        
      /*  _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
            self.snake.head.run(SKAction.move(to: CGPoint(x: snake.head.position.x, y: snake.head.position.y-ONE_STEP), duration: 0.70))
        }   */
    }
    
    
    
    func indexToPixe(index: Int) -> Int{
        return index*30
    }
    
   
    
    
    
    /*@objc func moveSnake(){
        
        var newDirection: String? = ""
        switch snake.currentDirection {
            
        case "left":
          
            newDirection = ["left", "up", "down"].randomElement()
            
            if newDirection == "left" {
                for i in 1...snake.body.count-1 {
                    snake.body[i].run(SKAction.move(to:snake.body[i-1].position , duration: 1/4 ))
                }
                
                snake.body[0].run(SKAction.move(to:snake.head.position , duration: 1/4 ))
                
                let newX = snake.head.position.x-ONE_STEP < ONE_STEP ? ONE_STEP:snake.head.position.x-ONE_STEP
                snake.head.run(SKAction.move(to:CGPoint(x: newX, y: snake.head.position.y), duration: 1/4))
                snake.currentDirection = newDirection
            }
            else if newDirection == "up" {
                
                for i in 1...snake.body.count-1 {
                    snake.body[i].run(SKAction.move(to:snake.body[i-1].position , duration: 1/4 ))
                }
                
                snake.body[0].run(SKAction.move(to:snake.head.position , duration: 1/4 ))
                snake.head.zRotation = CGFloat.pi
                let newY = snake.head.position.y+ONE_STEP > 480 ? 480:snake.head.position.y+ONE_STEP
                snake.head.run(SKAction.move(to:CGPoint(x: snake.head.position.x, y: newY), duration: 1/4))
                snake.currentDirection = newDirection
                
            }
            else if newDirection == "down" {
                
                for i in 1...snake.body.count-1 {
                    snake.body[i].run(SKAction.move(to:snake.body[i-1].position , duration: 1/4 ))
                }
                
                snake.body[0].run(SKAction.move(to:snake.head.position , duration: 1/4 ))
                snake.head.zRotation = 2*CGFloat.pi
                let newY = snake.head.position.y-ONE_STEP < ONE_STEP ? ONE_STEP:snake.head.position.y-ONE_STEP
                snake.head.run(SKAction.move(to:CGPoint(x: snake.head.position.x, y: newY) , duration: 1/4))
                snake.currentDirection = newDirection
            }
            
        case "right":
            
            newDirection = ["right", "up", "down"].randomElement()
            
            if newDirection == "right" {
                
                for i in 1...snake.body.count-1 {
                    snake.body[i].run(SKAction.move(to:snake.body[i-1].position , duration: 1/4 ))
                }
                
                snake.body[0].run(SKAction.move(to:snake.head.position , duration: 1/4 ))
                let newX = snake.head.position.x+ONE_STEP > 480 ? 480:snake.head.position.x+ONE_STEP
                snake.head.run(SKAction.move(to:CGPoint(x: newX, y: snake.head.position.y) , duration: 1/4 ))
                snake.currentDirection = newDirection
            }
            
            else if newDirection == "up" {
                
                for i in 1...snake.body.count-1 {
                    snake.body[i].run(SKAction.move(to:snake.body[i-1].position , duration: 1/4 ))
                }
                
                snake.body[0].run(SKAction.move(to:snake.head.position , duration: 1/4 ))
                snake.head.zRotation = CGFloat.pi
                let newY = snake.head.position.y+ONE_STEP > 480 ? 480:snake.head.position.y+ONE_STEP
                snake.head.run(SKAction.move(to:CGPoint(x: snake.head.position.x, y: newY) , duration: 1/4))
                snake.currentDirection = newDirection
                
            }
            else if newDirection == "down" {
                
                for i in 1...snake.body.count-1 {
                    snake.body[i].run(SKAction.move(to:snake.body[i-1].position , duration: 1/4 ))
                }
                
                snake.body[0].run(SKAction.move(to:snake.head.position , duration: 1/4 ))
                snake.head.zRotation = 2*CGFloat.pi
                let newY = snake.head.position.y-ONE_STEP < ONE_STEP ? ONE_STEP:snake.head.position.y-ONE_STEP
                snake.head.run(SKAction.move(to:CGPoint(x: snake.head.position.x, y: newY) , duration: 1/4 ))
                snake.currentDirection = newDirection
            }
            
        case "up":
           
            newDirection = ["up", "left", "right"].randomElement()
            
            if newDirection == "up" {
                
                for i in 1...snake.body.count-1 {
                    snake.body[i].run(SKAction.move(to:snake.body[i-1].position , duration: 1/4 ))
                }
                
                snake.body[0].run(SKAction.move(to:snake.head.position , duration: 1/4 ))
                let newY = snake.head.position.y+ONE_STEP > 480 ? 480:snake.head.position.y+ONE_STEP
                snake.head.run(SKAction.move(to:CGPoint(x: snake.head.position.x, y: newY) , duration: 1/4 ))
                snake.currentDirection = newDirection
            }
            else if newDirection == "left" {
                
                for i in 1...snake.body.count-1 {
                    snake.body[i].run(SKAction.move(to:snake.body[i-1].position , duration: 1/4 ))
                }
                
                snake.body[0].run(SKAction.move(to:snake.head.position , duration: 1/4 ))
                snake.head.zRotation = -CGFloat.pi/2
                let newX = snake.head.position.x-ONE_STEP < ONE_STEP ? ONE_STEP:snake.head.position.x-ONE_STEP
                snake.head.run(SKAction.move(to:CGPoint(x: newX, y: snake.head.position.y) , duration: 1/4 ))
                snake.currentDirection = newDirection
            }
            else if newDirection == "right" {
                
                for i in 1...snake.body.count-1 {
                    snake.body[i].run(SKAction.move(to:snake.body[i-1].position , duration: 1/4 ))
                }
                snake.body[0].run(SKAction.move(to:snake.head.position , duration: 1/4 ))
                snake.head.zRotation = CGFloat.pi/2
                let newX = snake.head.position.x+ONE_STEP > 480 ? 480:snake.head.position.x+ONE_STEP
                snake.head.run(SKAction.move(to:CGPoint(x: newX, y: snake.head.position.y) , duration: 1/4 ))
                snake.currentDirection = newDirection
            }
            
        case "down":
           
            newDirection = ["down", "left", "right"].randomElement()
            
            if newDirection == "down" {
                
                for i in 1...snake.body.count-1 {
                    snake.body[i].run(SKAction.move(to:snake.body[i-1].position , duration: 1/4 ))
                }
                snake.body[0].run(SKAction.move(to:snake.head.position , duration: 1/4 ))
                let newY = snake.head.position.y-ONE_STEP < ONE_STEP ? ONE_STEP:snake.head.position.y-ONE_STEP
                snake.head.run(SKAction.move(to:CGPoint(x: snake.head.position.x, y: newY) , duration: 1/4 ))
                snake.currentDirection = newDirection
            }
            else if newDirection == "left" {
                
                for i in 1...snake.body.count-1 {
                    snake.body[i].run(SKAction.move(to:snake.body[i-1].position , duration: 1/4 ))
                }
                
                snake.body[0].run(SKAction.move(to:snake.head.position , duration: 1/4 ))
                snake.head.zRotation = -CGFloat.pi/2
                let newX = snake.head.position.x-ONE_STEP < ONE_STEP ? ONE_STEP:snake.head.position.x-ONE_STEP
                snake.head.run(SKAction.move(to:CGPoint(x: newX, y: snake.head.position.y) , duration: 1/4 ))
                snake.currentDirection = newDirection
            }
            else if newDirection == "right" {
                
                for i in 1...snake.body.count-1 {
                    snake.body[i].run(SKAction.move(to:snake.body[i-1].position , duration: 1/4 ))
                }
                
                snake.body[0].run(SKAction.move(to:snake.head.position , duration: 1/4 ))
                snake.head.zRotation = CGFloat.pi/2
                let newX = snake.head.position.x+ONE_STEP > 480 ? 480:snake.head.position.x+ONE_STEP
                snake.head.run(SKAction.move(to:CGPoint(x: newX, y: snake.head.position.y) , duration: 1/4 ))
                snake.currentDirection = newDirection
            }
            
        default:
            print("Ok !")
        }
        
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
    }*/
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("YOUUUUHOOUUUU")
    }
    
    override func update(_ currentTime: TimeInterval) {
        if (currentTime - self.timeOfLastMove < 0.35) {
            return
        }
        self.env.step()
        self.timeOfLastMove = currentTime
    }
    
    // func touchesEnded(_ touches: Set<NSTouch>, with event: NSEvent?) {
    //}
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        env.snake.head.position = location
    }
    
}

