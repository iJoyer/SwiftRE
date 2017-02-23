//
//  MapViewController.swift
//  RealEstate
//
//  Created by iJoyer Yip on 17/2/2017.
//  Copyright © 2017 iJoyer. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, BMKMapViewDelegate, CLLocationManagerDelegate {

    var mapView: BMKMapView?
    var locationService: CLLocationManager = CLLocationManager()
    @IBOutlet weak var _mapView: UIView!
    
    
    func setMap() {
        
        
        mapView = BMKMapView(frame: CGRect(x: 0, y: 0, width: _mapView.frame.width, height: _mapView.frame.height))
        //let center = CLLocationCoordinate2D(latitude: 31.245087, longitude: 121.506656)
        //设置地图的显示范围（越小越精确）
        //let span = BMKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        //设置地图最终显示区域
        //let region = BMKCoordinateRegion(center: center, span: span)
        //mapView?.region = region
        
        
        locationService.delegate = self
        locationService.desiredAccuracy = kCLLocationAccuracyBest
        locationService.distanceFilter = 10
        locationService.requestWhenInUseAuthorization()
        if (CLLocationManager.locationServicesEnabled()) {
            locationService.startUpdatingLocation()
        }
        
       // mapView?.showsUserLocation = false
        mapView?.userTrackingMode = BMKUserTrackingModeNone
        mapView?.showsUserLocation = true
        
        _mapView.addSubview(mapView!)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation: CLLocation = locations.last!
        mapView?.centerCoordinate = currentLocation.coordinate
    }
    
    
    func didUpdateUserHeading(_ userLocation: BMKUserLocation!) {
        mapView?.updateLocationData(userLocation)
    }
    
    func didUpdateBMKUserLocation(userLocation: BMKUserLocation!) {
        mapView?.updateLocationData(userLocation)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mapView?.viewWillAppear()
        mapView?.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mapView?.viewWillDisappear()
        mapView?.delegate = nil
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMap()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
