//
//  AccountViewController.swift
//  FairDriverInternAssignment
//
//  Created by Islam Rzayev on 19.10.24.
//

import UIKit
import FirebaseAuth

class AccountViewController: UIViewController {
   
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!    
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel.text = Auth.auth().currentUser?.email
    

    }
    
    
   
    

    @IBAction func logoutPressed(_ sender: Any) {
        do{
            try Auth.auth().signOut()
        }catch{
            print("error")
        }
        self.performSegue(withIdentifier: "toSignInVC", sender: nil)
    }
    
}
