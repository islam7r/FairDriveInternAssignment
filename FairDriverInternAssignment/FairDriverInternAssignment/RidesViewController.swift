//
//  RidesViewController.swift
//  FairDriverInternAssignment
//
//  Created by Islam Rzayev on 19.10.24.
//

import UIKit
import FirebaseFirestore
import Firebase

class RidesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var ridesTableView: UITableView!
    var dateArray = [Timestamp]()
    var locationArray = [String]()
    var priceArray = [Int]()
    var userEmailArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ridesTableView.delegate = self
        ridesTableView.dataSource = self
        getDataFromFirestore()
    }
    
    func getDataFromFirestore(){
        
        let firestoreDatabase = Firestore.firestore()
        
        firestoreDatabase.collection("RideHistory").getDocuments { (snapshot, error) in
            if error != nil{
                self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
            }else{
                if snapshot?.isEmpty != true{
                    for document in snapshot!.documents{
                        if let date = document.get("date") as? Timestamp{
                            self.dateArray.append(date )
                        }
                        if let location = document.get("location") as? String{
                            self.locationArray.append(location)
                        }
                        if let price = document.get("price") as? Int{
                            self.priceArray.append(price)
                        }
                        if let userEmail = document.get("userEmail") as? String{
                            self.userEmailArray.append(userEmail)
                        }
                    }
                    self.ridesTableView.reloadData()
                }
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rideCell = ridesTableView.dequeueReusableCell(withIdentifier: "rideCell", for: indexPath) as? RideTableViewCell
        
        rideCell?.monthLabel.text = "October"
        rideCell?.locationLabel.text = locationArray[indexPath.row]
        rideCell?.dateLabel.text = "10.09.2004"
        rideCell?.priceLabel.text = "5.65 usd"
        
        
        return rideCell!
        
    }

    func makeAlert(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }

}
