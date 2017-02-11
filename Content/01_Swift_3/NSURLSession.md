# NSURLSession

[Resources](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/URLLoadingSystem/Articles/UsingNSURLSession.html)

## About the URL Loading System
The URL loading system is a set of protocols and classes that allow your app to access content referenced by a URL. The foundation framework supports, load the contents, upload data to servers, manage cookie storage, control response caching, handle credential storage, and authentication in app-specific ways, and write custom protocol extensions.

The URL loading system supports:
- File Transfer Protocol (ftp://)
- Hypertext Transfer Protocol (http://)
- Hypertext Transfer Protocol with encryption (https://)
- Local file URLs (files://)
- Data URLs (data://)

## Overview

<img src=/Content/01_Swift_3/resources/The_URL_Loading_System.png/ width=800px title="Overview of the URL Loading System">

### URL Loading
The most common way to retrieve the content of a URL from the source is `NSURLSession`.

#### Fetching Content as Data (In Memory) and Download
At a higher level, two approaches to fetching URL data:
1. `NSURLSession` for simple requests to get `Data` from `NSURL`.
2. `NSURLRequest` for more complex requests that require uploading data

> Downloads initiated by an `NSURLSession` instance are not cached. You must use either `NSURLSession` and write the data to disk itself.

### Helper Class
#### URL requests
An `NSURLRequest` object encapsulates a URL and any protocol-specific properties. The `NSURLResponse` class provide additional metadata. For example, `NSHTTPURLResponse` stores the headers and the status code returned by the web server.

> Only the metadata for the response is stored in an `NSURLResponse` object. The various URL loading classes provide the response data itself to your app either through a completion handler block or to the object's delegate.

## Using NSURLSession
The `NSURLSession` class and related class provide an API for downloading content via HTTP. It provides authentication and background downloads when your app is not running, even when your app is suspended.

To use the `NSURlSession` API, your app creates a series of group of tasks. Since is highly asynchronous, you have to provide a completion handler block that returns data to your app successfully with an error. It also provides status and progress properties. It supports canceling, restarting, resuming, suspending.

## Understanding URL Session Concept
### Types of Sessions
- **Default Sessions:** A persistent disk-based cache and store credentials in the user's keychain.
- **Ephemeral Sessions::** Do not store any data to disk but cached and stored on RAM an purged automatically.
- **Background Sessions:** Similar to Default Sessions, but a separate process handles all data transfers.

### Types of Tasks
- **Data Task:** Send and receive data using `Data` objects. `Data` can be received one piece at a time or a bulk using completion handlers.
- **Download Task:** Retrieve data in the form of a file, and support background downloads while the app is not running.
- **Upload Task:** Send data in the form of a file, and support background uploads while the app is not running.

### Background Transfer Considerations
The `NSURLSession` class supports background transfers while your app is suspended. Only done through a background session configuration object.

For this, the actual transfer is performed by a separate process and because restarting of an app is expensive, there are limitations:

- The session must provide a delegate for every delivery
- Only HTTP and HTTPS protocols are supported.
- Redirects are always followed
- Only upload tasks from a file are supported.
- If initialized in the background, the configuration object's
- Discretionary property becomes `true`.

In iOS, when a background transfer completes or requires credentials, if your app is no longer running, iOS relaunches your app in the background and calls the `application:handleEventsForBackgroundURLSession:completionHandler:` method on your app’s UIApplicationDelegate object. This call provides the identifier of the session that caused your app to be launched. Your app should store that completion handler, create a background configuration object with the same identifier, and create a session with that configuration object. The new session is automatically reassociated with ongoing background activity. Later, when the session finishes the last background download task, it sends the session delegate a `URLSessionDidFinishEventsForBackgroundURLSession:` message. In that delegate method, call the previously stored completion handler on the main thread so that the operating system knows that it is safe to suspend your app again.

If any task completed while your app was suspended, the delegate's `URLSession:downloadTask:didFinishDownloadingURL:` method is then called with the task and the URL for the newly downloaded file.

If any tasks requires credentials, the `NSURLSession` object calls the delegate's `URLSession:taskDidReceiveChallege:completionHandler:` method or `URLSession:didReceiveChallenge:completionHandler:`

## Creating and Configuring a Session
The `NSURLSession` API provides a wide range of configuration options:
- Private storage support for caches, cookies, credentials, protocols
- Authentication, tied to a specific request (task), or groups of requests (session)
- File uploads and downloads by URL
- Configuration of the maximum number of connections per host
- Custom proxy dictionaries
- Control over cookie policies
- Control over HTTP pipelining behavior

> If your app needs to be perform background transfers, it must provide a custom delegate.

```swift
import Foundation

typealias CompletionHandler = () -> Void

class MySessionDelegate : NSObject, URLSessionDelegate, URLSessionTaskDelegate, URLSessionDataDelegate, URLSessionDownloadDelegate, URLSessionStreamDelegate {
    var completionHandlers: [String: CompletionHandler] = [:]
}
```

```swift
// Creating session configurations
let defaultConfiguration = URLSessionConfiguration.default()
let ephemeralConfiguration = URLSessionConfiguration.ephemeral()
let backgroundConfiguration = URLSessionConfiguration.backgroundSessionConfiguration(withIdentifier: "com.myapp.networking.background")

// Configuring caching behavior for the default session
let cachesDirectoryURL = FileManager.default().urlsForDirectory(.cachesDirectory, inDomains: .userDomainMask).first!
let cacheURL = try! cachesDirectoryURL.appendingPathComponent("MyCache")
var diskPath = cacheURL.path

/* Note:
 iOS requires the cache path to be
 a path relative to the ~/Library/Caches directory,
 but OS X expects an absolute path.
 */
#if os(OSX)
diskPath = cacheURL.absoluteString
#endif

let cache = URLCache(memoryCapacity:16384, diskCapacity: 268435456, diskPath: diskPath)
defaultConfiguration.urlCache = cache
defaultConfiguration.requestCachePolicy = .useProtocolCachePolicy
// Creating sessions
let delegate = MySessionDelegate()
let operationQueue = OperationQueue.main()

let defaultSession = URLSession(configuration: defaultConfiguration, delegate: delegate, delegateQueue: operationQueue)
let ephemeralSession = URLSession(configuration: ephemeralConfiguration, delegate: delegate, delegateQueue: operationQueue)
let backgroundSession = URLSession(configuration: backgroundConfiguration, delegate: delegate, delegateQueue: operationQueue)
```

Default configuration fetching iTune's API
```swift
import UIKit
import Foundation

class ViewController: UIViewController {

  let sessionWithoutADelegate = URLSession(configuration: .default)

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    if let url = URL(string: "https://itunes.apple.com/search?term=jack+johnson&entity=musicVideo") {
      (sessionWithoutADelegate.dataTask(with: url) { (data, response, error) in
        if let error = error {
          print("Error: \(error)")
        } else if let response = response,
          let data = data,
          let string = String(data: data, encoding: .utf8) {
          print("Response: \(response)")
          print("DATA:\n\(string)\nEND DATA\n")
        }
      }).resume()
    }


  }
```


Final that works including delegate
```swift
import UIKit
import Foundation

class MySessionDelegate : NSObject, URLSessionDelegate, URLSessionTaskDelegate, URLSessionDataDelegate, URLSessionDownloadDelegate, URLSessionStreamDelegate {

  func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
    print("You've received Data")
  }

  func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
    print("You've got an errror!")
  }

  func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
    print("You've finished downloaidng!")
  }

}



class ViewController: UIViewController, URLSessionDelegate, URLSessionDataDelegate, NSURLConnectionDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    let operationQue = OperationQueue.main

    let defaultSession = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: operationQue)


    if let url = URL(string: "https://itunes.apple.com/lookup?id=284910350") {
      (defaultSession.dataTask(with: url) { (data, response, error) in
        if let error = error {
          print("Error: \(error)")

        } else if let response = response,
          let data = data,
          let string = String(data: data, encoding: .utf8) {
          // print("Response: \(response)")
          // print("DATA:\n\(string)\nEND DATA\n")
        }
      }).resume()
    }
  }


  func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
    print("You've receieved your data")
  }

  func urlSession(_ session: URLSession, task: URLSessionTask, didFinishCollecting metrics: URLSessionTaskMetrics) {
    print("Finished")
    print(task)
  }

  func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
    print("You've recevied response")
  }

}
```


## REST, HTTP, JSON

[Resources from Raywenderlich]: https://www.raywenderlich.com/147086/alamofire-tutorial-getting-started-2

- HTTP is the application protocol, or set of rules, web sites use to transfer data from the web server to your screen.
- GET: Used to retrieve data. Doesn’t alter any data on the server.
HEAD: Identical to GET but only sends back the headers and none of the actual data.
- POST: Used to send data to the server
- PUT: Used to send data to the specific location provided.
- DELETE: Deletes data from the specific location provided.
