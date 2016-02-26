//
//  DirectionViewController.swift
//  SushiYasaka
//
//  Created by Justin Espejo on 2/25/16.
//  Copyright © 2016 QC.quack. All rights reserved.
//

import MapKit
import UIKit
import CoreLocation
import AddressBook

class DirectionViewController: UIViewController {

    @IBOutlet weak var Item: UIBarButtonItem!
    @IBOutlet weak var mapView: MKMapView!
    var coords: CLLocationCoordinate2D?


    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        Item.target = self.revealViewController()
        Item.action = Selector("revealToggle:")
        
        let initialLocation = CLLocation(latitude: 40.7509669, longitude: -74.0030246)

        let regionRadius: CLLocationDistance = 1000
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                regionRadius * 2.0, regionRadius * 2.0)
            mapView.setRegion(coordinateRegion, animated: true)
        }
        
        centerMapOnLocation(initialLocation)
        let address = Address(title: "Sushi Yasaka",
            locationName: "New York",
            discipline: "Restaurant",
            coordinate: CLLocationCoordinate2D(latitude: 40.7509669, longitude: -74.0030246))
        
        mapView.addAnnotation(address)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func openMapsAppButtonPressed(sender: AnyObject)
    {
        let geoCoder = CLGeocoder()
            
        
            
//            geoCoder.geocodeAddressString(addressString, completionHandler:
//                {(placemarks: [AnyObject]!, error: NSError!) in
//                    
//                    if error != nil {
//                        print("Geocode failed with error: \(error.localizedDescription)")
//                    } else if placemarks.count > 0 {
//                        let placemark = placemarks[0] as! CLPlacemark
//                        let location = placemark.location
//                        self.coords = location.coordinate
//                        
//                        self.showMap()
//        
//                    }
//            })
//        
//    
    }
    
    
}
    extension DirectionViewController: MKMapViewDelegate {
        
        // 1
        func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
            if let annotation = annotation as? Address {
                let identifier = "pin"
                var view: MKPinAnnotationView
                if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
                    as? MKPinAnnotationView { // 2
                        dequeuedView.annotation = annotation
                        view = dequeuedView
                } else {
                    // 3
                    view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                    view.canShowCallout = true
                    view.calloutOffset = CGPoint(x: -5, y: 5)
                }
                return view
            }
            return nil
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


