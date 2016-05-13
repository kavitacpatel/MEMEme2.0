//
//  MeMeTableViewController.swift
//  MEME2.0
//
//  Created by kavita patel on 4/11/16.
//  Copyright © 2016 kavita patel. All rights reserved.
//

import UIKit

class MeMeTableViewController: UITableViewController {

   
    var memes: [MeMe]!
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    override func viewWillAppear(animated: Bool)
    {
        let applicationDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        memes = applicationDelegate.memes
        tableView.reloadData()
           }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return memes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        if let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as? MeMeTableViewCell
        {
            cell.configCell(memes[indexPath.row])
            return cell
        }
        else
        {
            return UITableViewCell()
        }
     }
   
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "detailViewSegue"
        {
            if let detailVC = segue.destinationViewController as? detailViewController
            {
                let selectedRow = self.tableView.indexPathForSelectedRow?.row
                    detailVC.receivedImage = memes[selectedRow!].memedImage!.image
            }
        }
    }
}