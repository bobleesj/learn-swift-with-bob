## Learn BLE Feb, 3, 2017
References: [Apple's Documentation](https://www.google.com)

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
## Discovering the Characteristics of a Service

When you find a service that you are interested in, the next step in exploring what a peripheral has to offer is discovering all of the service's characteristics. Call, `didcoverCharacteristics:forService:` method:

```swift
func peripheral(_ peripheral: CBPeripheral,
                didDiscoverCharacteristicsForservice: CBService,
                error: Error?) {
    for characteristic: CBCharacteristic in service.characteristics {

    }
}
```

## Receiving the Value of a Characteristic 

A characteristic contains a single value that represents information about a peripheral's service. Ex) a temperature measurement characteristic of a health thermometer service may have a value that indicates a temperature in Celsius. 

### Reading the Value of a Characteristic

```swift
peripheral.readValue(for: interestingCharacteristic)
```
When you attempt to read the value of a characteristic, the peripheral calls the `peripheral:didUpdateValueForCharacteristic:error:` method of its delegate object to retrieve the value. If the value is successfully retrieved, you can access it through the characteristic's value property. 

```swift
func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
    var data: Data? = characteristic.value
    // parse the data as needed
}
```

> **Note:** Not all characteristics are readable. You can determine whether a characteris is readable by checking if its `properties` attribute includes the `CBCharacteristicPropertyRead` constant. If you try to read a value of a characteristic that isn't readable, `peripheral:didUpdateValueForCharacteristic:error:` delegate method returns a suitable error


### Subscribing to a Characteristic's Value
Through reading the value of a characteristic using the `readValueForCharacter:` method can be effective for static values. But, it's not the best for dynamic value. For example, your heart rate monitor may change value. 

```swift
peripheral.setNotifyValue(true, for: interestingCharacteristic)
```
When you subscribe, the peripheral calls the `peripheral:didUpdateNotificationStateForCharacteristic:error:` method of its delegate object. 

```swift
func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateForCharacteristic characteristic: CBCharacteristic, error: Error?) throws {
    if error != nil {
        print("Error changing notification state: \(error?.localizedDescription)")
    }
}
```

> Not all characteristics offer subscription. You can determine if a characteristic offers subscript by checking if its properties attribute include either of the `CBCharacteristicPropertyNotify` or `CBCharacteristicPropertyIndicate` constants. 

After time the peripheral device notifies your app when the value has changed and it calls, `peripheral:didUpdateValueForCharacteristic:error:` method of its delegate object. 

## Writing the Value of a Characteristic
If you'd like to control your thermostat with your phone, you should be able to. If a characteristic's value is writeable, you can write by calling the peripheral's, `writeValue:forCharacteristic:type:` method. 

```swift
print("Writing value for characteristic \(interestingCharacteristic)")
peripheral.writeValue(dataToWrite, forCharacteristic: interestingCharacteristic, type: CBCharacteristicWriteWithResponse)
```

When you write the value of a characteristic, you specify what type of write you want to perform. The type above is `CBCharacteristicWriteWithResponse` which instructs the peripheral to let your app know whether or not the write succeeds by calling the `peripheral:didWriteValueForCharacteristic:error:` method of its delegate object. You also implement this delegate method to the handle the error condition, as the following example shwos: 

```swift
func peripheral(_ peripheral: CBPeripheral, didWriteValueForCharacteristic characteristic: CBCharacteristic, error: Error?) throws {
    if error != nil {
        print("Error writing characteristic value: \(error?.localizedDescription)")
    }
}
```

If instead you specify the write type as `CBCharacteristicWriteWithoutResponse`, the write operation is performed as best-effort, and delivery is neither guarantteed nor reported. The peripheral does not call the delegate method. 

