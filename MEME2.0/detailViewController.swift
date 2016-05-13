//
//  detailViewController.swift
//  MEME2.0
//
//  Created by kavita patel on 4/14/16.
//  Copyright © 2016 kavita patel. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

   
    @IBOutlet weak var detailImageView: UIImageView!
    var receivedImage: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        if receivedImage != nil
        {
           detailImageView.image = receivedImage
        }
    }
   }
