//
//  ViewController.swift
//  FairDriverInternAssignment
//
//  Created by Islam Rzayev on 19.10.24.
//

import UIKit
import FirebaseAuth


class ViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        initializeHideKeyboard()
        
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }


    @IBAction func signInPressed(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != ""{
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (authData, error) in
                if error != nil{
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Auth Error")
                }else{
                    self.performSegue(withIdentifier: "toHomeVC", sender: nil)
                }
            }
        }else{
            makeAlert(titleInput: "Error", messageInput: "Email or Password is not correct")
        }
        
    }
    
    @IBAction func toSignUp(_ sender: Any) {
        if emailText.text != "" && passwordText.text != ""{
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (authData, error) in
                if error != nil{
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Auth Error")
                }else{
                    self.performSegue(withIdentifier: "toHomeVC", sender: nil)
                }
            }
        }else{
            makeAlert(titleInput: "Error", messageInput: "Email or Password is not correct")
        }    }
    
    @IBAction func unHidePassword(_ sender: UIButton) {
        passwordText.isSecureTextEntry.toggle()
        let buttonImage = passwordText.isSecureTextEntry ? UIImage(systemName: "eyeglasses") : UIImage(systemName: "eyeglasses.slash")
            sender.setBackgroundImage(buttonImage, for: .normal)
    }
    
    
    

    
    func makeAlert(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
}

