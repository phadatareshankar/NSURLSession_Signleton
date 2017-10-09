//
//  ViewController.swift
//  VideoCodeSample
//
//  Created by Shankar Phadatare on 10/4/17.
//  Copyright © 2017 Shankar Phadatare. All rights reserved.
//

import UIKit
import GoogleAPIClientForREST
import GoogleSignIn



class LoginViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {

    
    @IBOutlet var signInButton: GIDSignInButton!
    
    private let scopes = [kGTLRAuthScopeYouTubeReadonly]
    
    private let service = GTLRYouTubeService()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure Google Sign-in.
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().scopes = scopes
        GIDSignIn.sharedInstance().signInSilently()
        
        
    
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            showAlert(title: "Authentication Error", message: error.localizedDescription)
            self.service.authorizer = nil
        } else {
            self.signInButton.isHidden = true
            
            self.service.authorizer = user.authentication.fetcherAuthorizer()
            
            CacheCenter.sharedInstance.storeCache(key: "token", value: user.authentication.accessToken);
            
            DispatchQueue.main.async {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.changeRootToTabBarContoller();
            }
            
        }
    }
    
    // Helper for showing an alert
    func showAlert(title : String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertControllerStyle.alert
        )
        let ok = UIAlertAction(
            title: "OK",
            style: UIAlertActionStyle.default,
            handler: nil
        )
        
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

