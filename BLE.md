## Learn BLE Jan, 20, 2017

By default, your app is unable to perform Bluetooth low energy tasks while it is in the background or in a suspended state. That said, if your app needs to perform Bluetooth low energy tasks while in the background, you can declare it to support one or both of the Core Bluetooth background execution modes (there’s one for the central role, and one for the peripheral role). 


![link](https://developer.apple.com/library/content/documentation/NetworkingInternetWeb/Conceptual/CoreBluetooth_concepts/Art/AdvertisingAndDiscovery_2x.png)

![link](https://developer.apple.com/library/content/documentation/NetworkingInternetWeb/Conceptual/CoreBluetooth_concepts/Art/CBPeripheralData_Example_2x.png)


A central can also interact with a peripheral’s service by reading or writing the value of that service’s characteristic. On the central side, a local central device is represented by a CBCentralManager object. These objects are used to manage discovered or connected remote peripheral devices (represented by CBPeripheral objects), including scanning for, discovering, and connecting to advertising peripherals.

![link](https://developer.apple.com/library/content/documentation/NetworkingInternetWeb/Conceptual/CoreBluetooth_concepts/Art/TreeOfServicesAndCharacteristics_Remote_2x.png)

### Common Central Role Task 
* Start up a central manager object
* Discover and connect to peripheral devices that are advertising
* Explore the data on a peripheral device after you’ve connected to it
* Send read and write requests to a characteristic value of a peripheral’s service
* Subscribe to a characteristic’s value to be notified when it is updated

## Starting Up a Central Manager

```swift
myCentralManager = CBCentralManager(delegate: self, queue: nil, options: nil)
```
In this example, `self` is set as the delegate to receive any central role events. By specifying the dispatch queue as nil, the central manager dispatches central role events using the main queue. 

When you create a central manager, it calls the `centralManagerDidUpdateState` method of its delegate object. 

> You must implement this delegate method to ensure that BLE is supported and available to use on the central device. 

## Discovering Peripheral Devices That Are Advertising

Once initialized, the central manager's first task is peripheral discovery as it advertises themselves. Your app discovers nearby peripheral devices that are advertising by calling the central manager's `scanForPeripheralsWithServices:options:` method. 

```swift 
myCentralManager.scanForPeripheralsWithServices(nil, options: nil)
```

> If you specify `nil` for the first parameter, the central manager returns *all* discovered peripherals, regardless of the supported devices. In real apps, you tyically specify an array of `CBUUID` objects, each of which represents the universally unique identifier (UUID) of a service that a peripheral is advertising. 

Every time the central discovers a peripheral, it calls the `centralManager:didDiscoverPeripheral:advertisementData:RSSI:` method of its delegate objects. The newly discovered peripheral is returned as a `CBPeripheral` object. 

```swift 
func centralManager(central: CBCentralManager, 
                    didDiscoverPeripheral peripheral: CBPeripheral,
                    advertisementData: [NSObject : AnyObject],
                    RSSI: Int) {
    print("Discovered \(peripheral.name)")
    self.discoveredPeripheral = peripheral
}
```
If you expect to connect to multiple devices, you might keep instead an `Array` of discovered peripherals. In case you've done finding, you can call

```swift
 myCentralManager.stopSacn
```
## Discovering the Characteristics of a Service 
When you find a service that you are interested in, you request a connection to the peripheral by calling 

```swift 
myCentralManager.connect(peripheral, options: nil)
```

If the connection is successful, the central manager calls, `centralManager:didConnectPeripheral`

```swift
func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
    print("Peripheral connected")
    peripheral.delegate = self
}
```

## Discovering the Services of a Peripheral That You're Connected To 

```swift 
 peripheral.discoveredServices(nil)
```
> **Note:** In real app, you typically do not pass in `nil` as the parameter, because doing so returns all the services available on a peripheral device. Because a peripheral may contain many more services than you are interested in. It may waste battery life, and an unncessary use of time. You typically specify the UUIDs of the services that you already know you are interested in discovering. 

When the specified services are discovered, the peripheral calls the `peripheral:didDiscoverServices:` method of its delegate object. Core Bluetooth createa an array of `CBServices` objects. 

```swift
func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
    for service: CBService in peripheral.services {

    }
}
```





