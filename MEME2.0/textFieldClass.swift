//
//  textFieldClass.swift
//  MEME2.0
//
//  Created by kavita patel on 4/14/16.
//  Copyright © 2016 kavita patel. All rights reserved.
//

import UIKit

class textFieldClass: UITextField {

    override func awakeFromNib() {
        
        let memeTextAttributes = [
            NSStrokeColorAttributeName : UIColor.blackColor(),
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName : UIFont(name: "Arial", size: 25)!,
            NSStrokeWidthAttributeName : -2.0
        ]
        self.defaultTextAttributes = memeTextAttributes
        self.font = UIFont.boldSystemFontOfSize(25)
        self.textAlignment = NSTextAlignment.Center
        self.autocapitalizationType = UITextAutocapitalizationType.AllCharacters
        
    }
    
}
