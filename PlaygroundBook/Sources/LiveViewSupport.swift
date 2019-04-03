/*
 
 Copyright © 2018 Apple Inc.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */
import UIKit
import PlaygroundSupport

/// Instantiates a new instance of a live view.
///
/// By default, this loads an instance of `LiveViewController` from `LiveView.storyboard`.
public func instantiateLiveView(chapter: Int, page: Int) -> PlaygroundLiveViewable {
    //return the LiveView for the specific chapter and page
    let chapterAndPage = (chapter, page)
    var storyBoardName = "LiveView"
    switch chapterAndPage {
        case let (x , y ) where x > 0 && y > 0:
        storyBoardName = "LiveView" + "_\(x)" + "_\(y)"

        default:
        storyBoardName = "LiveView"
    }

    
    let storyboard = UIStoryboard(name: storyBoardName, bundle: nil)

    guard let viewController = storyboard.instantiateInitialViewController() else {
        fatalError("\(storyBoardName).storyboard does not have an initial scene; please set one or update this function")
    }

    guard let liveViewController = viewController as? LiveViewController else {
        fatalError("\(storyBoardName).storyboard's initial scene is not a LiveViewController; please either update the storyboard or this function")
    }

    return liveViewController
}

// - MARK: Custom code from WWDC 2018 Session 413

public protocol PlaygroundValueConvertible {
    func asPlaygroundValue() -> PlaygroundValue
}

// For custom values which implements the PlaygroundValueConvertible protocol
public func sendValue(_ value: PlaygroundValueConvertible) {
    let page = PlaygroundPage.current
    let proxy = page.liveView as! PlaygroundRemoteLiveViewProxy
    proxy.send(value.asPlaygroundValue())
}

// For simple PlaygroundValue supported values
public func sendValue(_ value: PlaygroundValue) {
    let page = PlaygroundPage.current
    let proxy = page.liveView as! PlaygroundRemoteLiveViewProxy
    proxy.send(value)
}
