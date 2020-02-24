import UIKit
import PlaygroundSupport

var str = "Hello, playground"

let sharedSession = URLSession.shared
sharedSession.configuration.allowsCellularAccess
sharedSession.configuration.allowsCellularAccess = false
sharedSession.configuration.allowsCellularAccess

//: allowsCellularAccess is not changed it is false now.

let myDefaultConfigraton = URLSessionConfiguration.default
let eConfigraton = URLSessionConfiguration.ephemeral
let bConfigraton = URLSessionConfiguration.background(withIdentifier: "PkBackground")

myDefaultConfigraton.allowsCellularAccess = false
myDefaultConfigraton.allowsCellularAccess
bConfigraton.waitsForConnectivity = true

let myDefaultSession = URLSession(configuration: myDefaultConfigraton)
myDefaultSession.configuration.allowsCellularAccess

//: allowsCellularAccess is changed now.

let defaultSession = URLSession(configuration: .default)
defaultSession.configuration.allowsCellularAccess

/*:
 ## Important Links
 * https://www.raywenderlich.com/3244963-urlsession-tutorial-getting-started
 */

/*: Note
 ### If you think the Api is Body Then
 * URLSessionConfiguration Brain
 * URLSession is heart
 * Sessoin data task is hands
 */


/*:
 ### There are three subclass of url session Task
 * URLSessionDataTask
 * URLSessionUploadTask
 * URLSessionDownloadTask
 * A data task returns the response as an object in memory.
 * An upload task is very similar to a data task but it makes it much easier to provide a request body.
 * A download task doesn't return the response in memory but writes the data to a file and returns the location of the file.
*/
let configration = URLSessionConfiguration.default
configration.waitsForConnectivity = true
let session = URLSession(configuration: configration)

let url = URL(string: "https://jsonplaceholder.typicode.com/users")!

let task = session.dataTask(with: url) {
    (data,response,error) in
    guard let httpResponse = response as? HTTPURLResponse,
        httpResponse.statusCode == 200 else {
            return
    }

    guard let data = data else {
        print(error.debugDescription)
        return
    }

    if let data = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
        print(data)
    }
    PlaygroundPage.current.finishExecution()
}
task.resume()







