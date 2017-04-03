# RxSwift

## Observables and Observers


Two concepts to be aware of for this tutorial are the Observable and the Observer.
 - An Observable is something which emits notifications of change.
 - An Observer is something which subscribes to an Observable, in order to be notified when it has changed.
 - Observable(ObservableType) is equivalent to Sequence
 - ObservableType.subscribe method is equivalent to Sequence.makeIterator method.



Sequences can have 0 or more elements. Once an error or completed event is received, the sequence cannot produce any other element.


## Dispose
 This is a virtual “bag” of Observer objects which are disposed of when their parent object is deallocated

If a sequence terminates in finite time, not calling dispose or not using disposed(by: disposeBag) won't cause any permanent resource leaks. However, those resources will be used until the sequence completes, either by finishing production of elements or returning an error.

 When deinit() is called on the object which has a DisposeBag as a property, the bag is “emptied” and each disposable Observer is automatically unsubscribed from what it was observing. This allows ARC to take back memory as it normally would.

 Without a DisposeBag, you’d get one of two results: either the Observer would create a retain cycle, hanging on to what it’s observing indefinitely, or it could get deallocated out from under your object, causing a crash.


## RxCocoa
RxCocoa has reactive APIs for several different types of UI element. These give you options to set up things like UITableViews without the need to override delegate or data source methods directly.

http://cocoadocs.org/docsets/RxSwift/1.1/Classes/AnonymousObservable.html

https://www.raywenderlich.com/138547/getting-started-with-rxswift-and-rxcocoa

https://realm.io/news/slug-max-alexander-mvvm-rxswift/
