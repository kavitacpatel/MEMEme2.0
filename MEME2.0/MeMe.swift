//
//  MeMe.swift
//  MEME2.0
//
//  Created by kavita patel on 4/11/16.
//  Copyright © 2016 kavita patel. All rights reserved.
//

import Foundation
import UIKit

struct MeMe
{
    var topText: String?
    var bottomText: String?
    var image: UIImageView?
    var memedImage: UIImageView?
    init(_toptext: String, _bottomtext: String, _image: UIImage, _memeImage: UIImage)
    {
        topText = _toptext
        bottomText = _bottomtext
        let imageTemp = UIImageView(image: _image)
        let memedImageTemp = UIImageView(image:  _memeImage)
        image = imageTemp
        memedImage = memedImageTemp
    }
    
    
}