//
//  MeMeCollectionViewCell.swift
//  MEME2.0
//
//  Created by kavita patel on 4/13/16.
//  Copyright © 2016 kavita patel. All rights reserved.
//

import UIKit

class MeMeCollectionViewCell: UICollectionViewCell {
    
     var memeObj: MeMe!
    @IBOutlet weak var collectionViewImage: UIImageView!
    @IBOutlet weak var topTextView: UILabel!
    @IBOutlet weak var bottomTextView: UILabel!
    func configCell(meme: MeMe)
    {
        memeObj = meme
        collectionViewImage.image = memeObj.image?.image
        topTextView.text = memeObj.topText
        bottomTextView.text = memeObj.bottomText
        
    }
}
