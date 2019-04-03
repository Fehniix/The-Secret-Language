/*
 
 Copyright © 2018 Apple Inc.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

import SpriteKit

class BruteforceScene: SKScene {
    
    //  Private nodes
    fileprivate var labelNumber1: SKLabelNode!
    fileprivate var labelNumber2: SKLabelNode!
    fileprivate var labelNumber3: SKLabelNode!
    
    fileprivate var lockNode: SKSpriteNode!
    fileprivate var unLockNode: SKSpriteNode!
    
    fileprivate var keyNode: SKLabelNode!
    
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
        
        lockNode = SKSpriteNode(imageNamed: "Lock")
        lockNode.size = CGSize(width: 531, height: 471)
        lockNode.setScale(0.8)
        lockNode.position = CGPoint(x: frame.midX, y: frame.midY)
        lockNode.zPosition = 9
        addChild(lockNode)
        
        unLockNode = SKSpriteNode(imageNamed: "unLock")
        unLockNode.size = CGSize(width: 531, height: 471)
        unLockNode.setScale(0.8)
        unLockNode.position = CGPoint(x: frame.midX, y: frame.midY)
        unLockNode.zPosition = 8
        addChild(unLockNode)
        
        let midPoint: CGFloat = 140 * 0.8
        let offsetX: CGFloat = 114 * 0.8
        
        let labelPositionY = frame.midY - midPoint
        
        labelNumber1 = SKLabelNode()
        labelNumber1.text = "8"
        labelNumber1.fontName = "Avenir-Medium"
        labelNumber1.fontSize = 45
        labelNumber1.fontColor = .black
        labelNumber1.position = CGPoint(x: frame.midX - offsetX, y: labelPositionY - labelNumber1.frame.size.height / 2)
        labelNumber1.zPosition = 10
        addChild(labelNumber1)
        
        labelNumber2 = SKLabelNode()
        labelNumber2.text = "9"
        labelNumber2.fontName = "Avenir-Medium"
        labelNumber2.fontSize = 45
        labelNumber2.fontColor = .black
        labelNumber2.position = CGPoint(x: frame.midX, y: labelPositionY - labelNumber2.frame.size.height / 2)
        labelNumber2.zPosition = 10
        addChild(labelNumber2)
        
        labelNumber3 = SKLabelNode()
        labelNumber3.text = "0"
        labelNumber3.fontName = "Avenir-Medium"
        labelNumber3.fontSize = 45
        labelNumber3.fontColor = .black
        labelNumber3.position = CGPoint(x: frame.midX + offsetX, y: labelPositionY - labelNumber3.frame.size.height / 2)
        labelNumber3.zPosition = 10
        addChild(labelNumber3)
        
    }
    
    fileprivate func unlock() {
        let desaturatedGreen = UIColor(red: 152 / 255, green: 193 / 255, blue: 42 / 255, alpha: 1)
        
        self.lockNode.alpha = 0
        self.labelNumber1.fontColor = desaturatedGreen
        self.labelNumber2.fontColor = desaturatedGreen
        self.labelNumber3.fontColor = desaturatedGreen
    }
    
    fileprivate var forced: Bool = false
    fileprivate func bruteforce() {
        if forced {
            return
        }
        
        keyNode = SKLabelNode()
        keyNode.text = "Key: 0 - jzcbca"
        keyNode.fontName = "Avenir-Medium"
        keyNode.fontSize = 45
        keyNode.fontColor = UIColor.jColours.darkBlue
        keyNode.position = CGPoint(x: -keyNode.frame.size.width / 1600, y: -keyNode.frame.size.height / 4)
        keyNode.zPosition = 10
        
        let labelBackground = SKShapeNode(rectOf: CGSize(width: 338 * 1.6, height: 123 / 1.2), cornerRadius: 20)
        labelBackground.fillColor = .white
        labelBackground.position = CGPoint(x: frame.midX, y: frame.midY)
        labelBackground.zPosition = -2
        
        self.labelNumber1.removeFromParent()
        self.labelNumber2.removeFromParent()
        self.labelNumber3.removeFromParent()
        self.lockNode.removeFromParent()
        self.unLockNode.removeFromParent()
        
        labelBackground.addChild(keyNode)
        addChild(labelBackground)
        
        setupTime()
        forced = true
    }
    
    fileprivate func setupTime() {
        let runBlock = SKAction.run(updateCaesar)
        let sleep = SKAction.wait(forDuration: 0.8)
        let sequence = SKAction.sequence([runBlock, sleep])
        
        self.run(SKAction.repeat(sequence, count: -1), withKey: "updateCaesar")
    }
    
    fileprivate var currentKey: Int = 0
    fileprivate var currentString: String = "jzcbca"
    fileprivate func updateCaesar() {
        
        if currentKey == 18 {
            self.removeAction(forKey: "updateCaesar")
            
            keyNode.text = "Key = \(currentKey) → " + currentString
            keyNode.fontColor = UIColor.jColours.darkPink
            keyNode.text = keyNode.text! + " 🎊"
            
            return
        }
        
        keyNode.text = "Key = \(currentKey) → " + currentString
        
        currentString = caesarEncrypt(string: currentString, with: 1)
        currentKey += 1
        
    }
    
    fileprivate func caesarEncrypt(string: String, with key: Int) -> String {
        var stringBuilder = ""
        for char in string {
            var charCode = Int(char.unicodeScalars.map({ $0.value }).reduce(0, +)) + key
            charCode -= 96
            charCode = charCode % 26 == 0 ? 26 : charCode % 26
            charCode += 96
            stringBuilder.append(Character(UnicodeScalar(charCode)!))
        }
        return stringBuilder
    }
    
    fileprivate func updateLastNumber(_ number: String) {
        self.labelNumber3.text = number
    }
    
    public func proxyMessage(message: String) {
        if message == "unlock" {
            unlock()
        } else if message == "bruteforce" {
            bruteforce()
        } else {
            updateLastNumber(message)
        }
    }
    
}
