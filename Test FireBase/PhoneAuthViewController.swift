//
//  PhoneAuthViewController.swift
//  Test FireBase
//
//  Created by Артур Карачев on 04.10.2021.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class PhoneAuthViewController: UIViewController {

    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var codeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        codeField.isHidden = true

    }
    
    var verificatiod_id: String? = nil
    
    @IBAction func submitAction(_ sender: UIButton) {
        let phoneNumber = phoneField.text!
        let code = codeField.text!
        
        if codeField.isHidden {
            if !phoneNumber.isEmpty {
                Auth.auth().settings?.isAppVerificationDisabledForTesting = true
                
                PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
                    if error != nil {
                        return
                    } else {
                        self.verificatiod_id = verificationID
                        self.codeField.isHidden = false
                    }
                }
            } else {
                print("Please enter a phone number")
            }
        } else {
            if verificatiod_id != nil {
                let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificatiod_id!, verificationCode: code)
                Auth.auth().signIn(with: credential) { authData, error in
                    if error != nil {
                        print(error.debugDescription)
                    } else {
                        print("Auth success with phone - " + (authData?.user.phoneNumber! ?? "No phone number"))
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            } else {
                print("error in getting verification id")
            }

        }
        
    }
    @IBAction func closeAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
