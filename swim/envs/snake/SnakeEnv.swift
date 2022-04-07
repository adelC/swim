//
//  SnakeEnv.swift
//  CSAgent
//
//  Created by Adel Chaibi on 12/03/2022.
//

import SpriteKit


class SnakeEnv:Env {
    
    private var scene: SKScene!
    private var grid: SKSpriteNode!
    var apple: SKSpriteNode!
    var snake: SnakeAgent!
    private var timer: Timer?
    
    
    public override init() {
    }

    public init(scene: SKScene) {
        super.init()
        self.scene = scene
        createGrid()
        createFood()
        createSnake()
        scene.physicsWorld.gravity = .zero
        
    }
    
    
    /**
            Create Grid for fo the snake movement
     */
    func createGrid(){
        
        // Grid
        grid = SKSpriteNode(imageNamed: "Grid13")
        grid.alpha = 1.0
        grid.position = CGPoint(x: scene.frame.midX, y: scene.frame.midY)
        grid.zPosition = -1
        scene.addChild(grid)
        grid.run(SKAction.fadeIn(withDuration: 2))
    }
    
    /**
     
     */
    func createFood(){
        
        // Apple
        let x = Int.random(in: 1...20)
        let y = Int.random(in: 1...20)
        apple = SKSpriteNode(imageNamed: "Apple")
        apple.physicsBody = SKPhysicsBody(texture: apple.texture!, size: apple.texture!.size())
        apple.size.width = apple.size.width*1/22
        apple.size.height = apple.size.height*1/22
        apple.position = CGPoint(x: indexToPixe(index: x), y: indexToPixe(index: y))
        apple.alpha = 1.0
        apple.physicsBody?.isDynamic = false
        scene.addChild(apple)
    }
  
    
    /**
     
     */
    func createSnake(){
        
        // Snake
        snake = SnakeAgent()
        snake.head.position = CGPoint(x: scene.frame.midX-15, y: scene.frame.midY-15)
        snake.head.physicsBody!.contactTestBitMask = snake.head.physicsBody!.collisionBitMask
        scene.addChild(snake.head)
        
        snake.body[0].position = CGPoint(x: scene.frame.midX-15, y: scene.frame.midY+15)
        scene.addChild(snake.body[0])
        
        snake.body.append(SKShapeNode(rectOf: CGSize(width: 22, height: 22)))
        snake.body[1].fillColor = SKColor.orange
        snake.body[1].alpha = 1.0
        snake.body[1].position = CGPoint(x: scene.frame.midX-15, y: scene.frame.midY+45)
        scene.addChild(snake.body[1])
        
    }
    
    func indexToPixe(index: Int) -> Int{
        return index*30
    }
    

    override func start() {
        
      //  timer = Timer.scheduledTimer(timeInterval: 0.35, target: self, selector: #selector(moveSnake), userInfo: nil, repeats: true)
            
            
           // self.step()
    }
    
    
    override public func step() {
        
       // let movement = SKAction.move(to: CGPoint(x: snake.head.position.x + 30, y: snake.head.position.y + 30), duration: 0.50)
        //snake.head.run(movement)
        moveSnake()
    }
    
    override func update(currentTime: TimeInterval) {
        
        print("Hollaaa !!!")
        
        /*if (currentTime - self.timeOfLastMove < settings.timeFrameDelayer) {
            return
        }*/

        //self.snake.update()
        
        //self.timeOfLastMove = currentTime
        
    }
    
    
    
    @objc func moveSnake(){
        
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
        
      //  physicsWorld.gravity = .zero
      //  physicsWorld.contactDelegate = self
    }
    
    
}
