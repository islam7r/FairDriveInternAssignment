//
//  RegisterViewController.swift
//  FairDriverInternAssignment
//
//  Created by Islam Rzayev on 20.10.24.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var nameTextR: UITextField!
    @IBOutlet weak var emailTextR: UITextField!
    @IBOutlet weak var phoneNumR: UITextField!
    @IBOutlet weak var passwordTextR: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpRPressed(_ sender: Any) {
//        performSegue(withIdentifier: "toHomeTab", sender: nil)
    }
    @IBAction func signInRPressed(_ sender: Any) {
//        performSegue(withIdentifier: "toSignInPage", sender: nil)
        
    }
    
    @IBAction func unHidePasswordRPressed(_ sender: UIButton) {
        
    }
    
//    func makeAlertR(titleInput: String, messageInput: String){
//         let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
//         let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
//         alert.addAction(okButton)
//         self.present(alert, animated: true)
//     }
    
    

}
