/*
 
 Copyright © 2018 Apple Inc.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

import Foundation
import PlaygroundSupport
import UIKit

public class FancyMessageHandler: PlaygroundRemoteLiveViewProxyDelegate {
    public func remoteLiveViewProxyConnectionClosed(_ remoteLiveViewProxy: PlaygroundRemoteLiveViewProxy) {}
    
    public func remoteLiveViewProxy(_ remoteLiveViewProxy: PlaygroundRemoteLiveViewProxy, received message: PlaygroundValue) {
        if case .string(let string) = message {
            if string == "completed" {
                PlaygroundPage.current.assessmentStatus = .pass(message: "Cool! ✨ You can go to the next page!")
            }
        }
    }
    
    public init() {}
}

extension UIColor {
    struct jColours {
        static private let colourSet = [
            UIColor(red: 62 / 255, green: 184 / 255, blue: 174 / 255, alpha: 1),      //  Dark blue
            UIColor(red: 127 / 255, green: 199 / 255, blue: 175 / 255, alpha: 1),     //  Light blue
            UIColor(red: 218 / 255, green: 216 / 255, blue: 167 / 255, alpha: 1),     //  Yellow
            UIColor(red: 255 / 255, green: 158 / 255, blue: 157 / 255, alpha: 1),     //  Light Pink
            UIColor(red: 255 / 255, green: 61 / 255, blue: 126 / 255, alpha: 1),      //  Dark pink
            UIColor.black
        ]
        
        static let darkBlue = colourSet[0]
        static let lightBlue = colourSet[1]
        static let yellow = colourSet[2]
        static let lightPink = colourSet[3]
        static let darkPink = colourSet[4]
        
        static func randomColour() -> UIColor {
            return colourSet.randomElement()!
        }
    }
}

extension Int: PlaygroundValueConvertible {
    public func asPlaygroundValue() -> PlaygroundValue {
        return .integer(self)
    }
}

extension String: PlaygroundValueConvertible {
    public func asPlaygroundValue() -> PlaygroundValue {
        return .string(self)
    }
}
