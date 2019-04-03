/*
 
 Copyright © 2018 Apple Inc.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

import SpriteKit
import PlaygroundSupport

class ASCIIScene: SKScene {
    
    //  Private nodes
    fileprivate var associationLabelNodes: [SKLabelNode]! = []
    fileprivate var associationLabelBGNodes: [SKShapeNode]! = []

    override func didMove(to view: SKView) {
        setupScene()
        setupReferenceTable()
        setupTime()
    }
    
    override func update(_ currentTime: TimeInterval) {}
    
    fileprivate func setupScene() {
        
        let background = SKShapeNode(rect: frame)
        background.fillColor = UIColor.jColours.yellow
        background.zPosition = -10
        addChild(background)
        
    }
    
    fileprivate func setupReferenceTable() {
        
        let fixedSizeX = frame.size.width / 2 / 3.5
        let fixedSizeY = SKLabelNode(text: "w = 23").frame.size.height * 3
        let initialPositionX = frame.midX / 1.4
        
        var currentPositionX = initialPositionX
        var currentPositionY = frame.midY * 1.8
        
        for index in 0 ... 25 {
            
            let bg = SKSpriteNode(imageNamed: "labelBG")
            bg.size = CGSize(width: 338 / 2.5, height: 123 / 2.5)
            bg.position = CGPoint(x: currentPositionX, y: currentPositionY * 1.01)
            bg.zPosition = -2
            bg.color = .white
            bg.colorBlendFactor = 1
            
            let associationLabelNode = SKLabelNode()
            associationLabelNode.fontColor = UIColor.jColours.darkBlue
            associationLabelNode.fontName = "Avenir-Medium"
            associationLabelNode.name = String(Character(UnicodeScalar(96 + index + 1)!)) + " = "
            associationLabelNode.text = String(Character(UnicodeScalar(96 + index + 1)!)) + " = " + String(index + 1)
            associationLabelNode.position = CGPoint(x: 0, y: -associationLabelNode.frame.size.height / 2.2)
            associationLabelNode.zPosition = 1
            associationLabelNodes.append(associationLabelNode)
            
            bg.addChild(associationLabelNode)
            addChild(bg)
            
            currentPositionX += fixedSizeX
            if (index + 1) % 3 == 0 {
                currentPositionY -= fixedSizeY
                currentPositionX = initialPositionX
            }

        }
        
    }
    
    fileprivate func setupTime() {
        let runBlock = SKAction.run(updateObfuscatedText)
        let sleep = SKAction.wait(forDuration: 0.06)
        let sequence = SKAction.sequence([runBlock, sleep])
        
        self.run(SKAction.repeat(sequence, count: -1), withKey: "updateObfuscatedText")
    }
    
    fileprivate func updateObfuscatedText() {
        let randomSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!£$%^&*()[];'#,./"
        
        for label in associationLabelNodes {
            label.text = label.name! + String(randomSet.randomElement()!)
        }
    }
    
    fileprivate func fillTable() {
        self.removeAction(forKey: "updateObfuscatedText")
        
        for (index, label) in associationLabelNodes.enumerated() {
            label.text = label.name! + String(index + 1)
        }
    }
    
    public func proxyMessage(message: String) {
        if message == "fill" {
            fillTable()
        }
    }
    
}
