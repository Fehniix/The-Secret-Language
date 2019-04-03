/*
 
 Copyright © 2018 Apple Inc.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

import UIKit
import SpriteKit
import Foundation
import PlaygroundSupport

var introductionScene: IntroductionScene!

public class LiveViewController_1_1: LiveViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            
            introductionScene = IntroductionScene(size: view.bounds.size)
            // Set the scale mode to scale to fit the window
            introductionScene.scaleMode = .aspectFill
            introductionScene.handler = sendCompleted
            
            // Present the scene
            view.presentScene(introductionScene)
            view.shouldCullNonVisibleNodes = false
            
            view.ignoresSiblingOrder = true
            
        }
    }
    
    func sendCompleted() {
        send("completed".asPlaygroundValue())
    }
    
    public override func receive(_ message: PlaygroundValue) {
        
        if case .string(let string) = message {
            introductionScene.proxyMessage(message: string)
        }
        
    }

}
