//
//  MemeCollectionViewController.swift
//  MemeMe.2
//
//  Created by shaden on ١٩ ربيع١، ١٤٤٠ هـ.
//  Copyright © ١٤٤٠ هـ shaden. All rights reserved.
// MemeMe 2.0

import UIKit

class MemeCollectionViewController:  UICollectionViewController{
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        let dimension2 = (view.frame.size.height - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension2)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView!.reloadData()
        self.navigationItem.title = "Sent Memes"
    
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let memeds : Meme = self.memes[(indexPath as NSIndexPath).row]
        
        cell.memedimageView?.image = memeds.memedImage
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        
        // Grab the DetailVC from Storyboard
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "detailViewController") as! detailViewController
        
        //Populate view controller with data from the selected item
        detailController.memeds = self.memes[(indexPath as NSIndexPath).row]
        
        // Present the view controller using navigation
        self.navigationController!.pushViewController(detailController, animated: true)
    }
}
