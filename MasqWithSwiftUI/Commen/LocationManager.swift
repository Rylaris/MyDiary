//
//  LocalManager.swift
//  MasqWithSwiftUI
//
//  Created by 温蟾圆 on 2020/6/19.
//  Copyright © 2020 温蟾圆. All rights reserved.
//

import CoreLocation
import Foundation

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    var location = CLLocation()
    var manager = CLLocationManager()
    var placemark: CLPlacemark?
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        manager.distanceFilter = 1000
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func updateLocation() {
        manager.startUpdatingLocation()
    }
    
    func getCity() -> String? {
        var currentCity: String? = UserDefaults.standard.string(forKey: "lastCity")
        if placemark != nil {
            currentCity = placemark?.locality
        }
        return currentCity
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .denied:
            break
        default:
            manager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("定位成功")
        location = locations[0]
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location, completionHandler: {(placemark, error) in
            UserDefaults.standard.set(placemark?.first?.locality, forKey: "lastCity")
            self.placemark = placemark?.first
        })
    }
}
