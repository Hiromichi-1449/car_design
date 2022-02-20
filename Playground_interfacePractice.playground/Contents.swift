import Foundation
import Darwin

let collision = driverAssistance()  // calling out functions here
let engine = remoteStart()    // same as engine
let car = Car(collision: collision, engine: engine)

// Think as a customer. Better mindset.

// data : property
// function: methods

// Constructor injection:
class Car {
    let collision: collision_protocol
    let engine : engine_protocol
    
    init(collision: collision_protocol, engine: engine_protocol) {
        self.collision = collision
        self.engine = engine
    }
}

// protocols:
protocol engine_protocol {
    func start()
    func stop()
    func unlockDoors()
    func lockDoors()
}

protocol collision_protocol {
    func tooDamnClose()
    func autoBraking()
    func beepingAlarm()
}

class remoteStart: engine_protocol {
    var rpm: Int = 0
    var areDoorsLocked: Bool = false
    // the rpm is the variable correlated with the engine_protocol
    func start() {
        if (rpm == 0 && areDoorsLocked == true){
        print("Engine is on, idling")
        rpm = 1500
        }
    }
    
    func stop() {
        if (areDoorsLocked == false){
        print("Engine is off")
        rpm = 0
        }
    }
    
    func unlockDoors() {
        areDoorsLocked = false
    }
    
    func lockDoors() {
        areDoorsLocked = true
    }
}

class driverAssistance: collision_protocol {
    var distance: Int = 200
    var decibel: Int = 0
    var speed: Int = 85
    
    func tooDamnClose() {
        print ("MDFK you're too close!")
        speed = 30
        distance = 30
    }
    
    func autoBraking() {
        print ("Holycow my drink just spilled")
        speed = 15
        distance = 10
    }
    
    func beepingAlarm() {
        print ("TIME FOR ROAD RAGE")
        decibel = 80
    }
}
