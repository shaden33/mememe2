//
//  detailViewController.swift
//  MemeMe
//
//  Created by shaden on ٢٤ ربيع١، ١٤٤٠ هـ.
//  Copyright © ١٤٤٠ هـ shaden. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {
    
    var memeds: Meme!
    
    @IBOutlet weak var imageDeteil: UIImageView!
    

    override func viewWillAppear(_ animated: Bool) {
        imageDeteil.image = memeds.memedImage
    }
    
    
}
