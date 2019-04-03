//#-hidden-code
import Foundation
import PlaygroundSupport

fileprivate func bruteforceAttack() {
    sendValue("bruteforce".asPlaygroundValue())
}

//#-code-completion(everything, hide)
//#-code-completion(literal, show, integer)
//#-code-completion(identifier, show, bruteforceAttack())

//#-end-hidden-code

/*:
# The... **Bruto**Force attack. 🤭
 
Imagine now having an **encrypted** message written from someone else: it’s all *confused* and you can’t read it! You suspect, however, that the **encryption method** might be the **Caesar Cipher** we just used. 🧐
What can we do about it? We want to know what the code says! So let's... [Brutus](glossary://Brutus)-... *force* it.

Take a look at the **lock** on the right: to unlock it, you have to find out the correct combination.\
The combination, however, is only made of **three** numbers — the solution then is pretty simple: start from `000` and go all the way up to `999`!\
`000`, `001`, `002`… `997`, `998` and `999`! The correct combination surely was within that set of numbers.
 
 + Experiment: *Finding the combination!*\
The owner of the lock on the right forgot to reset two of the numbers of the combination, you already have two out of three!\
**Type** the last number **below** and **tap** on `Run My Code` to find the correct combination.
*/
let lastNumber = /*#-editable-code your numbers here!*/0/*#-end-editable-code*/
/*:
This is how a **Bruteforce Attack** works. It’s why your password should be **secure** and **difficult** to discover because otherwise some people would be able to do what we just did and they would grab it!

Our cipher is, also, **vulnerable** to this attack.
 
 Let's apply the concept of **Bruteforce Attack** and see it in action!\
 The next demonstration shows how we can decrypt the string `jzcbca` encrypted with the **Caesar Cipher** just by starting from a `key = 1` to `key = 26`; `key` is "how much" we add to each of our number-letters of `jzcbca`, `10 26 3 2 3 1`, to decrypt our string.
 
 + Experiment: *Let's decrypt* `jzcbca`!\
**Type** “`bruteforceAttack()`” to see a demonstration of **Bruteforce Attack** in action! 🚀
 
*/
//#-editable-code Tap to enter code
//#-end-editable-code
/*:
 # Conclusion
 At last, that is it for this Playground book! I truly hope you enjoyed it! ❤️\
 This book was written with the intention to introduce the concept of **cryptography**, oftentimes discredited exactly how it happens with **mathematics**: you do **NOT** need to have the "talent" to play around, study and like science, mathematics, cryptography, programming. By any mean. All it takes is curiosity, passion to investigate and read between the lines! ❤️✨ Be **curious**, always ask yourself "**why**". ✨, \
 **Thank you**! 🤗
 */

//#-hidden-code
sendValue(String(lastNumber).asPlaygroundValue())

if lastNumber == 6 {
    sendValue("unlock".asPlaygroundValue())
    PlaygroundPage.current.assessmentStatus = .pass(message: "You discovered the combination, well done! 🤩✨ You're **definitely becoming an expert already**! 🤯")
} else {
    PlaygroundPage.current.assessmentStatus = .fail(hints: ["Oops! Not the right one."], solution: nil)
}
//#-end-hidden-code
