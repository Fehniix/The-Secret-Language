/*
 
 Copyright © 2018 Apple Inc.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

import SpriteKit
import PlaygroundSupport

class IntroductionScene: SKScene {
    
    //  Private nodes
    fileprivate var bgNode: SKShapeNode!
    fileprivate var labelNode: SKLabelNode!
    fileprivate var rainbowNode: SKSpriteNode!
    fileprivate var encryptionSquares: [SKShapeNode] = []
    
    ///  Handler for Page - liveView communication!
    var handler: (() -> ())?
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        setupScene()
        setupEncryptionSquares()
        setupTime()
    }
    
    override func update(_ currentTime: TimeInterval) {}
    
    fileprivate func setupScene() {
        
        //  Setting up the scene's background
        bgNode = SKShapeNode(rectOf: self.frame.size)
        bgNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        bgNode.fillColor = UIColor.jColours.yellow
        bgNode.alpha = 0
        bgNode.zPosition = -3
        addChild(bgNode)
        
        //  Setting up the rainbow node!
        //  I chose the rainbow as an analogy to the start of my journey in cryptography and computer science.
        //
        //  The world looked stagnant, to me, it looked "off", black and white.
        //  As a teacher, Martino, introduced me to cryptography, technology and science, everything changed!
        //  I was able to see a colourful world, full of hope.
        //  I understood my place was near whomever needed some of that hope, who needed a simple smile.
        //  This is why I chose a rainbow.
        rainbowNode = SKSpriteNode(imageNamed: "Rainbow")
        rainbowNode.position = CGPoint(x: frame.midX, y: frame.midY)
        rainbowNode.size = CGSize(width: 1520, height: 644)
        rainbowNode.scale(to: CGSize(width: 1520 / 3.5, height: 644 / 3.5))
        rainbowNode.zPosition = -2
        addChild(rainbowNode)
        
        
        //  Font registration
        let fontURL = Bundle.main.url(forResource: "Nexa Bold", withExtension: "otf")! as CFURL
        CTFontManagerRegisterFontsForURL(fontURL, CTFontManagerScope.process, nil)
        
        //  Setting up the label node for "Cryptography"
        labelNode = SKLabelNode()
        labelNode.text = "Shenanigans!"
        labelNode.fontColor = UIColor.black
        labelNode.fontSize = 45
        labelNode.fontName = "Nexa Bold"
        labelNode.zPosition = -1
        labelNode.position = CGPoint(x: frame.midX, y: frame.midY - labelNode.frame.size.height * 1.55)
        addChild(labelNode)
        
    }
    
    //  This function sets up the "encryption squares": the squares that cover the rainbow.
    fileprivate func setupEncryptionSquares() {
        
        let squareSize = CGSize(width: rainbowNode.size.width / 10, height: rainbowNode.size.height / 4)
        
        let initialX = frame.midX - rainbowNode.size.width / 2 + (squareSize.width / 2)
        let initialY = frame.midY + rainbowNode.size.height / 2 - (squareSize.height / 2)
        
        let initialPosition = CGPoint(x: initialX, y: initialY)
        
        for index in 1 ... 40 {
            let squareNode = SKShapeNode(rectOf: CGSize(width: rainbowNode.size.width / 10, height: rainbowNode.size.height / 4))
            squareNode.fillColor = UIColor.jColours.randomColour()
            squareNode.strokeColor = .clear
            
            let positionOffsetX = initialPosition.x + (squareSize.width) * CGFloat(((index - 1) % 10))
            let positionOffsetY = initialPosition.y - (squareSize.height * CGFloat(Int((index - 1) / 10)))
            squareNode.position = CGPoint(x: positionOffsetX, y: positionOffsetY)
            
            addChild(squareNode)
            encryptionSquares.append(squareNode)
        }
        
    }
    
    //  This function is responsible for updating the colour of the encryption blocks every .1s.
    fileprivate func setupTime() {
        let runBlock = SKAction.run(updateColoursRunBlock)
        let sleep = SKAction.wait(forDuration: 0.1)
        let sequence = SKAction.sequence([runBlock, sleep])
        
        self.run(SKAction.repeat(sequence, count: -1), withKey: "updateColours")
    }
    
    //  Above function's handler!
    fileprivate func updateColoursRunBlock() {
        for square in encryptionSquares {
            square.fillColor = UIColor.jColours.randomColour()
        }
    }
    
    //  This one is pretty cool!
    //
    //  1. First it stops the colour update of the encryption blocks;
    //  2. Defines the physics body of the screen boundaries and assigns it a category bitmask;
    //  3. Defines and assigns a physics body to each encryption square and...
    //  4. BOOM! It applies an impulse to random directions to every square!
    fileprivate func decryptImage() {
        self.removeAction(forKey: "updateColours")
        
        let screenBoundaries = SKPhysicsBody(edgeLoopFrom: self.frame)
        screenBoundaries.affectedByGravity = false
        screenBoundaries.categoryBitMask = 0b10
        screenBoundaries.contactTestBitMask = 0b01
        screenBoundaries.collisionBitMask = 0b00
        self.physicsBody = screenBoundaries
        
        for squareNode in encryptionSquares {
            squareNode.physicsBody = SKPhysicsBody(rectangleOf: squareNode.frame.size)
            squareNode.physicsBody?.affectedByGravity = true
            squareNode.physicsBody?.categoryBitMask = 0b01
            squareNode.physicsBody?.contactTestBitMask = 0b10
            squareNode.physicsBody?.collisionBitMask = 0b00
            squareNode.physicsBody?.applyImpulse(CGVector(dx: CGFloat.random(in: -80 ... 80), dy: CGFloat.random(in: 1 ... 250)))
        }
        
        bgNode.run(SKAction.fadeIn(withDuration: 1))
        
        setupObfuscatedLabelTime()
    }
    
    //  As her sister above, this function sets up the time for the obfuscated text update!
    fileprivate func setupObfuscatedLabelTime() {
        let runBlock = SKAction.run(updateObfuscatedText)
        let sleep = SKAction.wait(forDuration: 0.06)
        let sequence = SKAction.sequence([runBlock, sleep])
        
        self.run(SKAction.repeat(sequence, count: -1), withKey: "updateText")
    }
    
    //  Handler! As above. Quite a tricky one! Up to you to understand it. Hint: take a look at Swift's documentation about arrays!
    fileprivate func updateObfuscatedText() {
        let randomSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!£$%^&*()[];'#,./"   // Hehehe. :)
        
        labelNode.text = String((0 ..< 12).map({ _ in randomSet.randomElement()! }))
    }
    
    //  Yet again, third sister! Asynchronous call to achieve the "one letter at a time" effect.
    fileprivate func setupDeobfuscationTime() {
        let runBlock = SKAction.run(updateDeobfuscationRunBlock)
        let sleep = SKAction.wait(forDuration: 0.06)
        let sequence = SKAction.sequence([runBlock, sleep])
        
        self.run(SKAction.repeat(sequence, count: -1), withKey: "updateDeobfuscation")
    }
    
    //  Pure black magic, isn't it?
    //  Let's go through it.
    fileprivate var iteration: Int = 0
    fileprivate var interval: TimeInterval = 0
    fileprivate var currentText: String = ""
    fileprivate func updateDeobfuscationRunBlock() {
        //  The interval is 0.4s every time this function gets called.
        //  It means that on every iteration the whole "current execution time" gets updated and upon reaching
        //  a certain point, something happens.
        interval += 0.4
        
        let randomSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!£$%^&*()[];'#,./"
        
        //  Self-explanatory! The handler makes the .pass message appear on the page.
        if iteration == 13 {
            self.removeAction(forKey: "updateDeobfuscation")
            
            if let handler = handler {
                handler()
            }
            
            return
        }
        
        //  This one is also a pretty good exercise. Hint: look up String initialisers and Swift's documentation on arrays!
        let cryptography = "Cryptography"
        let start = cryptography.startIndex
        let end = cryptography.index(start, offsetBy: iteration)
        let croppedCryp = cryptography[start ..< end]
        
        labelNode.text = croppedCryp + String((0 ..< 12 - iteration).map({ _ in randomSet.randomElement()! }))
        
        if interval > 2 {
            interval = 0
            iteration += 1
        }
    }
    
    //  Same as above!
    fileprivate func decryptText() {
        self.removeAction(forKey: "updateText")
        
        setupDeobfuscationTime()
    }
    
    //  Receiver function - it makes the class notice when the Playground Book page submitted a value.
    fileprivate var imageDecrypted: Bool = false
    public func proxyMessage(message: String) {
        if message == "decryptImage" {
            decryptImage()
            imageDecrypted = true
        }
        
        if message == "decryptText" {
            decryptText()
        }
    }
    
}

//  PHYSICS, YEAH!!!
extension IntroductionScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        print("contact!!!")
        if contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask == 0b11 {
            if contact.bodyA.categoryBitMask == 0b01 {
                contact.bodyA.node!.removeFromParent()
            } else {
                contact.bodyB.node!.removeFromParent()
            }
        }
    }
}
