//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

/*:
 Download tasks store the response data in a file so a download task with a URL or request and completion handler gets back a URL instead of a data object.
 
 This is the location of a temporary file,so the completion handler must either read and process the data in it or copy that file to a permanent location in your apps container directory.
 
 If it's canceled or fails before completing the download, you can save resume data and then resume the download later.
 
 Unlike data tasks, download tasks convert server-side errors into an NS error object and report them via the error parameter
 */

let dowenloadSession = URLSession(configuration: .default)
func dowenloadTask(urlString:String) {
    guard let url = URL(string: urlString) else {return}
    let task = dowenloadSession.downloadTask(with: url) {(location,response,Error) in
        
    }
}

