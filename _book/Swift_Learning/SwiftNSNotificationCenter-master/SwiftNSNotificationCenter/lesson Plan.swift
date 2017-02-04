

/*
 
 NS Notification isn't used for push notification. It's how you communicate between class/struct. 
 NSNotification is a manager who broadcasting service. He can send data or no. There are mainly two other ways: Using delgation and key value, but I will talk about benefits and differences probably in upcoming articles.
 
 You might want to create a separate file 
 
 It's time to set observers or listeners. 
 
 When the observer no longer interested, but it did a bit of space in memory, then remove it 
 deinit {
  NSNotificationCenter.default.removeObserver(self)
 }
 
 // Delegation is faster
 // If you have 100 notifications abserved, then slown down the device. 
 
 // The notiication center deliever the message to each registed observer snychrnously. 
 // use delegates when you want the receiving object to influence an action that will happen to the sending object.
 // use notifications when you need to inform multiple objects of an event.
 // Radio station, broadcast hteir message whoever is listening to, the raio station doesn't get and feedback.
  */
