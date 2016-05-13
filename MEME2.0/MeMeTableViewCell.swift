//
//  MeMeTableViewCell.swift
//  MEME2.0
//
//  Created by kavita patel on 4/13/16.
//  Copyright © 2016 kavita patel. All rights reserved.
//

import UIKit

class MeMeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var tableImageView: UIImageView!
    @IBOutlet weak var textView: UILabel!
    @IBOutlet weak var topText: UILabel!
    @IBOutlet weak var bottomText: UILabel!
    
    func configCell(meme: MeMe)
    {
        tableImageView.image = meme.image?.image
         topText.text = meme.topText
         bottomText.text = meme.bottomText
        textView.lineBreakMode = NSLineBreakMode.ByTruncatingMiddle;
        textView.text = topText.text! + " " + bottomText.text!
    }
}
