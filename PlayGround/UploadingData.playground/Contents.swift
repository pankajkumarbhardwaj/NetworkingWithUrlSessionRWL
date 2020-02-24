//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

/*:
URLSession comes with two tasks to manage the process,an upload task and a download task.
there are two other tasks as well. There's the URLSession data task as well as the URLSession stream task.

You've already seen the data task. It makes a request and returns a data object for you. It's good for requests that don't return much data
as the data isn't saved to a temporary file like the download task does.

The stream task is for creating bidirectional TCP/IP connections which is beyond the scope of this course.

Of course, all these tasks inherit from the URLSessionTask base class

but we're interested in uploading and for that, we'll use the URLSessionUploadTask.

With this task, we can provide some body data and the task manages the process of uploading it to a remote location.

Upload tasks with completion handler don't use delegates for response and data delivery but delegate methods for handling authentication challenges are still called.

Now you can't create an upload task with URL because you must set the HTTP method to post or put so you have to create a URLRequest.

UploadTask method have an additional parameter for specifying the data that will be uploaded.This is the data that you would put into the request HTTP body.

There's also a stream to upload request option although streaming is outside the scope of this course.

If we're interested in the task, we can respond to events by way of delegate methods.

//add pick 2 in notes
For general session events, we can implement the URLSession delegate protocol.
For task life cycle methods, there is the URLSession task delegate.
Finally, for uploading task, there is the URLSession data delegate protocol. And of course, for downloading,we also have a URLSession download delegate protocol.
There's actually even a streaming delegate protocol as well. These all have methods to respond to session and task events

//2:49

 
 */
