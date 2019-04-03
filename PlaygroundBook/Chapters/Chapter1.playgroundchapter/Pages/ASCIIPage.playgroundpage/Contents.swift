//#-hidden-code
import Foundation
import PlaygroundSupport

//#-code-completion(everything, hide)
//#-code-completion(literal, show, boolean)

//#-end-hidden-code

/*:
 # The "number-letters"!

 Our alphabet is made of 26 characters and we are all familiar with them: from “`a`”, which is number `1`, “`b`” number `2`, "`c`" number `3`… all the way to the “`z`” which is number `26`.

 + Experiment: *Creating our reference table!*
    1. **Set** the `fillAutomatically` value to `true` instead of `false`,
    2. **Tap** on `Run My Code`!
 */

let fillAutomatically = /*#-editable-code true or false*/false/*#-end-editable-code*/
let hello = /*#-editable-code your numbers here!*/""/*#-end-editable-code*/
let world = /*#-editable-code your numbers here!*/""/*#-end-editable-code*/

/*:
Then, after filling our table we can write in... **numbers**! 🤯

 + Experiment: *Let's encode!*\
**Write** within the double quotes above the numbers for the words "`hello`" and "`world`", good luck!

 - Example: *The correct format for both words!*\
`let hello = "1 2 3 4"`
 
 * Callout(Did you know?):
 `let` and `var` are what we call a "**variables**": they are like boxes, they contain a value and it can be of various types, like numbers and text.
 */

//#-hidden-code
if !fillAutomatically {
    PlaygroundPage.current.assessmentStatus = .fail(hints: ["Best to have a table already filled out, right? 😇 **Tap** on `fillAutomatically` and set its value, after the `=` sign, to `true`! 🚀"], solution: nil)
} else {
    if !hello.isEmpty && !world.isEmpty {
        let condition1 = hello.replacingOccurrences(of: " ", with: "") == "85121215"
        let condition2 = world.replacingOccurrences(of: " ", with: "") == "231518124"
        
        if condition1 && condition2 {
            PlaygroundPage.current.assessmentStatus = .pass(message: "Well done! 🤩✨ You're on your way to **become an expert**! You can go to the next page!")
        } else {
            PlaygroundPage.current.assessmentStatus = .fail(hints: ["The word \"`ciao`\" would be: \"`3 9 1 15`\" 😇"], solution: nil)
        }
    } else {
        PlaygroundPage.current.assessmentStatus = .fail(hints: ["Fill the fields first. 🧐"], solution: nil)
    }
}

if fillAutomatically {
    sendValue("fill".asPlaygroundValue())
}
//#-end-hidden-code
