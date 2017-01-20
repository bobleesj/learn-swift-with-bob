# Personal_iOS_UIKits

#### Set UIStatusBarStyle
```swift
  override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: true)
    }
```

#### Getting the App Versionlet 
```swift
 let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
```

#### UIAlertViewShow
```swift
 let alertView = UIAlertView.init(title: "About",
                                  message: aboutMessage!,
                                  delegate: self,
                                  cancelButtonTitle: "Ok",
                                  otherButtonTitles:"GitHub") 
  alertView.show()
```

####UIAlertViewDelegate

```swift
   func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        if buttonIndex == 1 {
            UIApplication.shared.openURL(URL(string: "https://github.com/NordicSemiconductor/IOS-nRF-Toolbox")!)
        }
    }
```
