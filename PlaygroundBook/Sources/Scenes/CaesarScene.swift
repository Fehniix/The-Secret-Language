/*
 
 Copyright © 2018 Apple Inc.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

import SpriteKit

class CaesarScene: SKScene {
    
    //  Private nodes
    fileprivate var labelHelloNode: SKLabelNode!
    fileprivate var labelHelloNumbersNode: SKLabelNode!
    
    fileprivate var labelWorldNode: SKLabelNode!
    fileprivate var labelWorldNumbersNode: SKLabelNode!
    
    override func didMove(to view: SKView) {
        setupScene()
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    fileprivate func setupScene() {
        
        let background = SKShapeNode(rect: frame)
        background.fillColor = UIColor.jColours.yellow
        background.zPosition = -10
        addChild(background)
        
        let labelBackground1 = SKShapeNode(rectOf: CGSize(width: 338 * 1.1, height: 123 / 1.2), cornerRadius: 20)
        labelBackground1.fillColor = .white
        labelBackground1.position = CGPoint(x: frame.midX, y: frame.midY * 1.15)
        labelBackground1.zPosition = -2
        
        labelHelloNode = SKLabelNode()
        labelHelloNode.text = "Hello"
        labelHelloNode.fontName = "Avenir-Medium"
        labelHelloNode.fontSize = 25
        labelHelloNode.position = CGPoint(x: -labelHelloNode.frame.size.width / 1600, y: labelHelloNode.frame.size.height / 1.1)
        labelHelloNode.fontColor = UIColor.jColours.darkBlue
        
        labelHelloNumbersNode = SKLabelNode()
        labelHelloNumbersNode.text = "8 5 12 12 15"
        labelHelloNumbersNode.fontName = "Avenir-Book"
        labelHelloNumbersNode.fontSize = 45
        labelHelloNumbersNode.position = CGPoint(x: 0, y: -labelHelloNumbersNode.frame.size.height)
        labelHelloNumbersNode.fontColor = UIColor.jColours.lightBlue
        
        let labelBackground2 = SKShapeNode(rectOf: CGSize(width: 338 * 1.1, height: 123 / 1.2), cornerRadius: 20)
        labelBackground2.fillColor = .white
        labelBackground2.position = CGPoint(x: frame.midX, y: frame.midY / 1.15)
        labelBackground2.zPosition = -2
        
        labelWorldNode = SKLabelNode()
        labelWorldNode.text = "World"
        labelWorldNode.fontName = "Avenir-Medium"
        labelWorldNode.fontSize = 25
        labelWorldNode.position = CGPoint(x: -labelWorldNode.frame.size.width / 160, y: labelWorldNode.frame.size.height / 1.3)
        labelWorldNode.fontColor = UIColor.jColours.darkBlue
        
        labelWorldNumbersNode = SKLabelNode()
        labelWorldNumbersNode.text = "23 15 18 12 4"
        labelWorldNumbersNode.fontName = "Avenir-Book"
        labelWorldNumbersNode.fontSize = 45
        labelWorldNumbersNode.position = CGPoint(x: 0, y: -labelWorldNumbersNode.frame.size.height)
        labelWorldNumbersNode.fontColor = UIColor.jColours.lightBlue
        
        labelBackground1.addChild(labelHelloNode)
        labelBackground1.addChild(labelHelloNumbersNode)
        addChild(labelBackground1)
        
        labelBackground2.addChild(labelWorldNode)
        labelBackground2.addChild(labelWorldNumbersNode)
        addChild(labelBackground2)
        
    }
    
    fileprivate func addOne() {
        
        let fadeOut = SKAction.fadeOut(withDuration: 0.5)
        
        let changeText = SKAction.run {
            self.labelHelloNumbersNode.text = "9 6 13 13 16"
            self.labelWorldNumbersNode.text = "24 16 19 13 5"
            
            self.labelHelloNumbersNode.fontColor = UIColor.jColours.lightPink
            self.labelWorldNumbersNode.fontColor = UIColor.jColours.lightPink
        }
        let fadeIn = SKAction.fadeIn(withDuration: 0.5)
        let sequence = SKAction.sequence([fadeOut, changeText, fadeIn])
        
        labelHelloNumbersNode.run(sequence)
        labelWorldNumbersNode.run(sequence)
        
    }
    
    fileprivate func decode() {
        
        let fadeOut = SKAction.fadeOut(withDuration: 0.5)
        
        let changeText = SKAction.run {
            self.labelHelloNumbersNode.text = "ifmmp"
            self.labelWorldNumbersNode.text = "xpsme"
            
            self.labelHelloNumbersNode.fontColor = UIColor.jColours.darkPink
            self.labelWorldNumbersNode.fontColor = UIColor.jColours.darkPink
            
            self.labelHelloNode.text = "😳 😳 😳"
            self.labelHelloNode.fontSize = 35
            
            self.labelWorldNode.text = "😳 😳 😳"
            self.labelWorldNode.fontSize = 35
        }
        let fadeIn = SKAction.fadeIn(withDuration: 0.5)
        let sequence = SKAction.sequence([fadeOut, changeText, fadeIn])
        
        labelHelloNumbersNode.run(sequence)
        labelWorldNumbersNode.run(sequence)
        
    }
    
    public func proxyMessage(message: String) {
        if message == "addOne" {
            addOne()
        }
        
        if message == "decode" {
            decode()
        }
    }
    
}
