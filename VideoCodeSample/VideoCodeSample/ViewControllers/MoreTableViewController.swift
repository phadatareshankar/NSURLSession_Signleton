//
//  MoreTableViewController.swift
//  VideoCodeSample
//
//  Created by Meenakshi Phadatare on 10/8/17.
//  Copyright © 2017 Shankar Phadatare. All rights reserved.
//

import UIKit
import GoogleAPIClientForREST
import GoogleSignIn

class MoreTableViewController: UITableViewController {

    let items = ["Logout"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moreCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = items[indexPath.row];
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        showAlert(msgStr: SIGN_OUT_MSG);
        
    }
    
    
    func showAlert(msgStr:String) {
        
        let alert = UIAlertController(title: "SignOut", message: msgStr, preferredStyle: .alert);
        
        let yesAction = UIAlertAction(title: "Yes", style: .default) { (alertAction) in
            GIDSignIn.sharedInstance().signOut()
            self.showLoginView()
            
        };
        
        let noAction = UIAlertAction(title: "No", style: .cancel) { (alertAction) in
            
        };
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        self.present(alert, animated: true) {
            
        }
    }
    
    func showLoginView()  {
        
        DispatchQueue.main.async() {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.showLoginViewController();
        }
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
