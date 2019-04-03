//#-hidden-code

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//#-code-completion(everything, hide)
//#-code-completion(identifier, show, decryptImage(), decryptText())

fileprivate func decryptImage() {
    sendValue("decryptImage".asPlaygroundValue())
}

fileprivate func decryptText() {
    sendValue("decryptText".asPlaygroundValue())
}

let page = PlaygroundPage.current
let proxy = page.liveView as! PlaygroundRemoteLiveViewProxy
let handler = FancyMessageHandler()
proxy.delegate = handler

//#-end-hidden-code

/*:
 
 # Goal
 The goal of this Playground book is to **teach everyone** *(and little humans too!)* and spread the ❤️ about **cryptography**, how it works, why it’s so useful and **beautiful** by explaining how a very simple [Caesar Cipher](glossary://Caesar%20Cipher) works.
 
 Everything can be encrypted: text, images, music... one day probably even smells. 👃🏼 Nowadays cryptography is *all around us* and silently keeps our data safe.
 No one understands it, however. It is deemed as difficult, complicated, very hard to understand… but it isn't, in reality, and the goal of this book is to *also* show how **fun** and **easy** cryptography can be.
 
 # Let's go!
 
 **Cryptography** sounds like a scary word… well, it isn’t! 😌
 It’s like *writing with an *invisible* pen* — it literally means “**writing in secret characters**”! In fact, it comes from the ancient Greek “*kryptos*” (hidden) + “*graphein*” (to write).
 
 Through our journey we will learn what cryptography is and why it’s so **fun** and **beautiful**!
 
 + Experiment: *Decrypting our image and text!*
    1. **Type** “`decryptImage()`”, **tap** on `Run My Code`;
    2. **Type** "`decryptText()`", **tap** on `Run My Code`;
    3. **See** what happens… 🧐

 - Callout(Did you know?):
 `decryptImage()` and `decryptText()` are what we call "**functions**": when you *call* them, they will execute a series of instructions that, in this case, will decrypt our image and text.
 */
//#-editable-code Tap to enter code
//#-end-editable-code
