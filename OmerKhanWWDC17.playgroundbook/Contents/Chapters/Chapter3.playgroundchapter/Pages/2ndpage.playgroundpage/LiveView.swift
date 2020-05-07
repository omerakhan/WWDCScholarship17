//
//  LiveView.swift
//
//
//  Created by Omer Khan on 3/25/17.
//
//

import PlaygroundSupport
import SpriteKit
import UIKit
import AVFoundation
import GameplayKit

let button = UIButton(frame: CGRect(x: 160, y: 600, width: 175, height: 50))

var wordTxt: SKLabelNode!
var choice1Txt: SKLabelNode!
var choice2Txt: SKLabelNode!



let width = 800 as CGFloat
let height = 1200 as CGFloat

struct CategoryMasks {
    static let word: UInt32 = 0x1 << 0
    static let correct: UInt32 = 0x1 << 1
    static let incorrect: UInt32 = 0x1 << 2
}

class GameScene: SKScene, SKPhysicsContactDelegate
{
    
    
    var fruits = ["Int" : "3️⃣", "Double" : "π", "String" : "🆎", "Delta" : "🔼", "Optional Chaining" : "❓", "Force Unwrap": "❗️"]
    
    var word: SKSpriteNode!
    var choice1: SKSpriteNode!
    var choice2: SKSpriteNode!
    var platform: SKSpriteNode!
    
    var wordOriginalPosition = CGPoint(x: 387, y: 1050)
    var correctNode = 0
    
    var correctAudio: AVAudioPlayer!
    var incorrectAudio: AVAudioPlayer!
    
    override func didMove(to view: SKView) {
        
        // word
        word = SKSpriteNode(color: UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0), size: CGSize(width: 217, height: 100))
        word.position = wordOriginalPosition
        addChild(word)
        
        // choices
        choice1 = SKSpriteNode(color: UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0), size: CGSize(width: 200, height: 200))
        choice1.position = CGPoint(x: 100, y: 450)
        addChild(choice1)
        
        choice2 = SKSpriteNode(color: UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0), size: CGSize(width: 200, height: 200))
        choice2.position = CGPoint(x: 700, y: 450)
        addChild(choice2)
        
        // platform
        platform = SKSpriteNode(color: UIColor.orange, size: CGSize(width: 270, height: 100))
        platform.position = CGPoint(x: 387, y: 900)
        addChild(platform)
        
        // labels
        wordTxt = SKLabelNode(text: "")
        wordTxt.position = CGPoint.zero
        wordTxt.fontSize = 80
        wordTxt.fontColor = UIColor.black
        word.addChild(wordTxt)
        
        choice1Txt = SKLabelNode(text: "")
        choice1Txt.position = CGPoint.zero
        choice1Txt.fontSize = 100
        choice1.addChild(choice1Txt)
        
        choice2Txt = SKLabelNode(text: "")
        choice2Txt.position = CGPoint.zero
        choice2Txt.fontSize = 100
        choice2.addChild(choice2Txt)
        
        // physics
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        word.physicsBody = SKPhysicsBody(rectangleOf: word.size)
        
        platform.physicsBody = SKPhysicsBody(rectangleOf: platform.size)
        platform.physicsBody?.affectedByGravity = false
        platform.physicsBody?.isDynamic = false
        
        choice1.physicsBody = SKPhysicsBody(rectangleOf: choice1.size)
        choice1.physicsBody?.affectedByGravity = false
        choice1.physicsBody?.isDynamic = false
        
        choice2.physicsBody = SKPhysicsBody(rectangleOf: choice2.size)
        choice2.physicsBody?.affectedByGravity = false
        choice2.physicsBody?.isDynamic = false
        
        // Collision
        physicsWorld.contactDelegate = self
        
        word.physicsBody?.categoryBitMask = CategoryMasks.word
        word.physicsBody?.contactTestBitMask = CategoryMasks.correct | CategoryMasks.incorrect
        
        setLabels()
        
        // Audio
        let correctPath = Bundle.main.path(forResource: "correct", ofType: "mp3")!
        let incorrectPath = Bundle.main.path(forResource: "incorrect", ofType: "mp3")!
        
        let correctURL = URL(fileURLWithPath: correctPath)
        let incorrectURL = URL(fileURLWithPath: incorrectPath)
        
        do {
            try correctAudio = AVAudioPlayer(contentsOf: correctURL)
            try incorrectAudio = AVAudioPlayer(contentsOf: incorrectURL)
            
            correctAudio.prepareToPlay()
            incorrectAudio.prepareToPlay()
        } catch {
            print(error)
        }
    }
    
    func setLabels() {
        var nameArray = [String]()
        var iconArray = [String]()
        
        
        for (key, value) in fruits {
            nameArray.append(key)
            iconArray.append(value)
        }
        
        let correctIndex = Int(arc4random_uniform(6))
        correctNode = Int(arc4random_uniform(2))
        let incorrectIndex = Int(arc4random_uniform(5))
        
        wordTxt.text = nameArray[correctIndex]
        
        if correctNode == 0 {
            choice1Txt.text = iconArray[correctIndex]
            choice1.physicsBody?.categoryBitMask = CategoryMasks.correct
            
            iconArray.remove(at: correctIndex)
            
            choice2Txt.text = iconArray[incorrectIndex]
            choice2.physicsBody?.categoryBitMask = CategoryMasks.incorrect
        } else {
            choice2Txt.text = iconArray[correctIndex]
            choice2.physicsBody?.categoryBitMask = CategoryMasks.correct
            
            iconArray.remove(at: correctIndex)
            
            choice1Txt.text = iconArray[incorrectIndex]
            choice1.physicsBody?.categoryBitMask = CategoryMasks.incorrect
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var body1Id: UInt32!
        var body2Id: UInt32!
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            body1Id = contact.bodyA.categoryBitMask
            body2Id = contact.bodyB.categoryBitMask
        } else {
            body1Id = contact.bodyB.categoryBitMask
            body2Id = contact.bodyA.categoryBitMask
        }
        
        if body1Id == CategoryMasks.word {
            var correct: Bool?
            
            if body2Id == CategoryMasks.correct {
                correctAudio.play()
                correct = true
            } else if body2Id == CategoryMasks.incorrect {
                incorrectAudio.play()
                correct = false
            }
            
            if let actuallyCorrect = correct {
                word.physicsBody = nil
                word.zRotation = 0
                word.position = wordOriginalPosition
                word.physicsBody = SKPhysicsBody(rectangleOf: word.size)
                word.physicsBody?.categoryBitMask = CategoryMasks.word
                word.physicsBody?.contactTestBitMask = CategoryMasks.correct | CategoryMasks.incorrect
                
                if actuallyCorrect {
                    let correctPath = Bundle.main.path(forResource: "correctParticle", ofType: "sks")!
                    let correctParticle = NSKeyedUnarchiver.unarchiveObject(withFile: correctPath) as! SKEmitterNode
                    
                    if correctNode == 0 {
                        correctParticle.position = choice1.position
                    } else {
                        correctParticle.position = choice2.position
                    }
                    
                    addChild(correctParticle)
                    
                    setLabels()
                } else {
                    let incorrectPath = Bundle.main.path(forResource: "incorrectParticle", ofType: "sks")!
                    let incorrectParticle = NSKeyedUnarchiver.unarchiveObject(withFile: incorrectPath) as! SKEmitterNode
                    
                    if correctNode == 0 {
                        incorrectParticle.position = choice2.position
                    } else {
                        incorrectParticle.position = choice1.position
                    }
                    
                    addChild(incorrectParticle)
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLoc = touch.location(in: self)
            let touchWhere = nodes(at: touchLoc)
            
            if !touchWhere.isEmpty {
                for node in touchWhere {
                    if let node = node as? SKSpriteNode {
                        if node == word {
                            word.position = touchLoc
                            word.physicsBody?.affectedByGravity = false
                        }
                    }
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLoc = touch.location(in: self)
            let touchWhere = nodes(at: touchLoc)
            
            if !touchWhere.isEmpty {
                for node in touchWhere {
                    if let node = node as? SKSpriteNode {
                        if node == word {
                            word.position = touchLoc
                        }
                    }
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLoc = touch.location(in: self)
            let touchWhere = nodes(at: touchLoc)
            
            if !touchWhere.isEmpty {
                for node in touchWhere {
                    if let node = node as? SKSpriteNode {
                        if node == word {
                            word.position = touchLoc
                            word.physicsBody?.affectedByGravity = true
                        }
                    }
                }
            }
        }
    }
    
    
    
}


let skView = SKView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: width, height: height)))
let scene = GameScene(size: skView.frame.size)

class Receiver {
    
    @objc func buttonClicked()
        
    {
        scene.removeAllChildren()
        skView.presentScene(scene)
        
        
        
    }
}

skView.presentScene(scene)

skView.scene?.backgroundColor = UIColor(red:1.00, green:0.80, blue:0.80, alpha:1.0)

button.backgroundColor = UIColor(red:0.40, green:0.60, blue:1.00, alpha:1.0)
button.layer.cornerRadius = 17
button.setTitle("Lost Label? Restart!", for: .normal)
let receiver = Receiver()
button.addTarget(receiver, action: #selector(Receiver.buttonClicked), for: .touchUpInside)


skView.addSubview(button)






PlaygroundPage.current.liveView =  skView










