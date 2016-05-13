//
//  labelViewClass.swift
//  MEME2.0
//
//  Created by kavita patel on 4/14/16.
//  Copyright © 2016 kavita patel. All rights reserved.
//

import UIKit

class labelViewClass: UILabel {
    override func awakeFromNib() {
        
        let _attributes = [
            NSForegroundColorAttributeName: UIColor.lightGrayColor(),
            NSFontAttributeName : "Arial"]
        self.attributedText = NSAttributedString(string: "", attributes: _attributes)
        self.font = UIFont.boldSystemFontOfSize(17)
        self.textAlignment = NSTextAlignment.Center
        
    }
  
}
