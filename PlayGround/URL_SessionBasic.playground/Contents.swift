import UIKit
import PlaygroundSupport

/*:
# URL Session
 ## An object that coordinates a group of related, network data-transfer tasks.
 For instance, you could configure all your task to run in the background,or you could also configure your tasks to run in the equivalent of privacy mode in browsers. That is, it doesn't store caches, credentials, or any session related data to disk.
 
 ### This is managed by a URLSessionConfiguration object. There are three types of this object:
 - a default configuration,
 - an ephemeral configuration,
 -  and a background configuration.
 
 * A default configuration object uses a persistent disc-based cache, except when the result is downloaded to a file. It stores credentials in the user's key chain, it uses default values for its properties, unless you customize it.
 
 * And a ephemeral configuration is like default but it doesn't store cookies, credentials,or cache data to disk. You can think of it like creating  an Incognito Window in Chrome or going into privacy mode in Firefox.
 
 * The last type of configuration is a background configuration. It can transfer data while the app runs in the background. It hands control of transfers over to the system  which handles the transfers in a separate process.   You must provide an identifier so the system can reconstruct its sessions  if the system terminates and relaunches the app.
 
 When you create a configuration object you can change any of its properties from their default values. However, you must make those changes before creating the URLSession instance.
 Changes made to a configuration object  after the session has been created have no effect on existing sessions.
 
 ### Configurations come with lots of properties  to determine how the app should access the network.
 * The time interval for a resource property determines the time a resource should take.
 * The waits for connectivity indicates whether a session should wait for connectivity or fail immediately.
 * You can also set cookie policies, minimum and maximum support for TLS, that is the Transport Layer Security protocol.
 * You can also set cache policies.
 You use the configuration to set the timeout interval whether the connection should use cellular access by default the value is set to true.
 
 
 ### Now, iOS 13 gives us a few other features.
 * First, you can designate a connection to allow constraint network access. If a user puts their device in low data mode then their connection is there by constrained. If there are no non-constrained interfaces available and this property is set to false  then all tasks will fail.
 * Allows expensive network access, determines whether the session should use a limited network connection like a cellular connection or a personal hotspot. Like the constrained network, if this is set to false and there are no non-expensive connections all tasks will fail.
 * For both the constrained access and expensive access property,you can put off tasks for a later time by setting waits for connectivity to true. This means that the task will wait for an available interface before starting.
*/

let sharedSession = URLSession.shared
sharedSession.configuration.allowsCellularAccess
sharedSession.configuration.allowsCellularAccess = false
sharedSession.configuration.allowsCellularAccess

//: allowsCellularAccess is not changed it is false now.

let myDefaultConfigraton = URLSessionConfiguration.default
let eConfigraton = URLSessionConfiguration.ephemeral
let bConfigraton = URLSessionConfiguration.background(withIdentifier: "PkBackground")

//: Notice we have to give the background configuration an identifier. This identifies the session. If the app is terminated while downloads are occurring you can use the identifier to recreate configuration in session objects associated with the transfer.

myDefaultConfigraton.allowsCellularAccess = false
myDefaultConfigraton.allowsCellularAccess
myDefaultConfigraton.allowsCellularAccess = true
myDefaultConfigraton.allowsConstrainedNetworkAccess = true

bConfigraton.waitsForConnectivity = true

//:If you do not want to change default configration then you can create a instance like
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







