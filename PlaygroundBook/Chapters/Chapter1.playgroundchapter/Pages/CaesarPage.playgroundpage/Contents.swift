//#-hidden-code
import Foundation
import PlaygroundSupport

fileprivate func addOne() {
    sendValue("addOne".asPlaygroundValue())
}

fileprivate func decode() {
    sendValue("decode".asPlaygroundValue())
    PlaygroundPage.current.assessmentStatus = .pass(message: "Well done! ✨")
}

//#-code-completion(everything, hide)
//#-code-completion(identifier, show, addOne(), decode())

//#-end-hidden-code

/*:
 # Writing in secret characters!
 
 Great, now we have our **number-words**!
 
 `let hello = “8 5 12 12 15”`\
 `let world = “23 15 18 12 4”`
 
 What would happen, now, if we were to **add** `1` to all our number-letters? 🤔 Let’s try it out!
 
 + Experiment: *Adding one to our "number-letters"!*\
**Type** `addOne()` to add `1` to our `hello` and `world` number-letters and **tap** on `Run My Code`!
*/
//#-editable-code Tap to enter code
//#-end-editable-code
/*:
 Our `hello`'s number-letters are now completely different, cool!
 
 And what would happen now if we were to “convert” our number-letters back to letters of the alphabet? Let’s experiment! 🔬
 
 + Experiment: *Let's *encrypt* "hello world"!*\
**Type** `decode()` and tap on `Run My Code` to get back to normal letters!
 */
//#-editable-code Tap to enter code
//#-end-editable-code
/*:
 
 … what?! 😳 That doesn’t mean anything!
 
 And this is because we have just ***written in secret characters***! We’re using **cryptography**, the **Caesar Cipher**, to hide (or [encrypt](glossary://encrypt)) our message in plain sight, how cool is that?! 🤯\
 If we subtract `1` to all our new numbers we would get back to our original message. If we choose, then, a secret number and add or subtract all of our numbers by it, we would get a new, secret message that only those who know the secret number would be able to read, or decrypt. **Cool**! ✨ You can go to the next page! 
 
 */

//#-hidden-code

//#-end-hidden-code
