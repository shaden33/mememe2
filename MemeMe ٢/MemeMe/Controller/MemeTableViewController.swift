//
//  MemeTableViewController.swift
//  MemeMe.2
//
//  Created by shaden on ١٩ ربيع١، ١٤٤٠ هـ.
//  Copyright © ١٤٤٠ هـ shaden. All rights reserved.
//

import UIKit

class MemeTableViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView : UITableView!
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView!.reloadData()
        self.navigationItem.title = "Sent Memes"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")!
        
        let memeds = self.memes[(indexPath as NSIndexPath).row]
        // Set the name and image
        
        cell.textLabel?.text = (memeds.topText + " ... " + memeds.bottomText)
        cell.imageView?.image =  memeds.memedImage
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Grab the DetailVC from Storyboard
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "detailViewController") as! detailViewController
        
        //Populate view controller with data from the selected item
        detailController.memeds = self.memes[(indexPath as NSIndexPath).row]
        
        // Present the view controller using navigation
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
    
}
