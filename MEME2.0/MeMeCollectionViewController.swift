//
//  MeMeCollectionViewController.swift
//  MEME2.0
//
//  Created by kavita patel on 4/13/16.
//  Copyright © 2016 kavita patel. All rights reserved.
//

import UIKit


class MeMeCollectionViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout{

    var memes: [MeMe]!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.whiteColor()
    }

    override func viewWillAppear(animated: Bool)
    {
        let applicationDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        memes = applicationDelegate.memes
        collectionView?.reloadData()
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
            return memes.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionViewCell", forIndexPath: indexPath) as? MeMeCollectionViewCell
        {
              cell.configCell(memes[indexPath.row])
               return cell
        }
        else
        {
                return UICollectionViewCell()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "detailViewSegue"
        {
            if let detailVC = segue.destinationViewController as? detailViewController
            {
                let indexPath = self.collectionView?.indexPathsForSelectedItems()
                detailVC.receivedImage = memes[(indexPath?[0].row)!].memedImage!.image
            }
        }
    }
}
