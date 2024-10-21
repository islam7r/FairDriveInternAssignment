//
//  HomeViewController.swift
//  FairDriverInternAssignment
//
//  Created by Islam Rzayev on 19.10.24.
//

import UIKit
import MapKit
import CoreLocation
import FloatingPanel
import FirebaseFirestore
import FirebaseAuth

protocol HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark)
}

class HomeViewController: UIViewController, CLLocationManagerDelegate, FloatingPanelControllerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    

    
    var selectedPin:MKPlacemark? = nil
    var resultSearchController:UISearchController? = nil
 

    let locationManager = CLLocationManager()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        mapView.showsUserLocation = true
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.isUserInteractionEnabled = true
        
        mapView.userTrackingMode = .none
        let locationSearchTable = storyboard!.instantiateViewController(withIdentifier: "LocationSearchTable") as! LocationSearchTable
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController?.searchResultsUpdater = locationSearchTable
        
        
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = resultSearchController?.searchBar
        
        
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        resultSearchController?.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        
        locationSearchTable.mapView = mapView
        locationSearchTable.handleMapSearchDelegate = self
        
       
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
       
        mapView.delegate = self
        
       
     
    }
    

    
    

    
    var hasSetInitialRegion = false

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let locationCoordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: locationCoordinate, span: span)
        
        // Set the region only if it hasn't been set before
        if !hasSetInitialRegion {
            mapView.setRegion(region, animated: true)
            hasSetInitialRegion = true
        }
    }

    @objc func getDirections(){
        if let selectedPin = selectedPin {
            let mapItem = MKMapItem(placemark: selectedPin)
            let launchOptions = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
            mapItem.openInMaps(launchOptions: launchOptions)
        }
    }
    


   
}


extension HomeViewController: HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark){
           // cache the pin
           selectedPin = placemark
           // clear existing pins
           mapView.removeAnnotations(mapView.annotations)
           let annotation = MKPointAnnotation()
           annotation.coordinate = placemark.coordinate
           annotation.title = placemark.name
           if let city = placemark.locality,
           let state = placemark.administrativeArea {
               annotation.subtitle = "\(city) \(state)"
           }
           mapView.addAnnotation(annotation)
           let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
           let region = MKCoordinateRegion(center: placemark.coordinate, span: span)
           mapView.setRegion(region, animated: true)
        
        let firestoreDatabase = Firestore.firestore()
        var firestoreReference: DocumentReference? = nil
        let firestoreRideHistory = ["userEmail": Auth.auth().currentUser?.email!, "location": placemark.name, "date": FieldValue.serverTimestamp(), "price": 5] as [String : Any]
        firestoreReference = firestoreDatabase.collection("RideHistory").addDocument(data: firestoreRideHistory, completion: { (error) in
            if error != nil{
                self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "error")
            }
        })
       }
    
}

extension HomeViewController : MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation{
            return nil
        }
        
        let reuseId = "myAnnotation"
        var pinview = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        
        if pinview == nil{
            pinview = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinview?.canShowCallout = true
            pinview?.tintColor = UIColor.black
            
            
            let button = UIButton(type: UIButton.ButtonType.detailDisclosure)
         
            pinview?.rightCalloutAccessoryView = button
        }else{
            pinview?.annotation = annotation
        }
        
        return pinview
        
    }
    func makeAlert(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
}
