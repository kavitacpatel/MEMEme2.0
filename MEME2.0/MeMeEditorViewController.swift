//
//  ViewController.swift
//
//
//  Created by kavita patel on 4/9/16.
//  Copyright © 2016 kavita patel. All rights reserved.
//

import UIKit
import CoreData

class MeMeEditorViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate{
    
    @IBOutlet weak var editorImageView: UIImageView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var topText: UITextField!
    @IBOutlet weak var bottomText: UITextField!
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var shareBtn: UIBarButtonItem!
    @IBOutlet weak var cameraPickerBtn: UIBarButtonItem!
    let imgpicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editorImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        textFieldEnable(false)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if(!UIImagePickerController.isSourceTypeAvailable(.Camera))
        {
            cameraPickerBtn.enabled = false
        }
        addObserver()
    }
    
       func addObserver()
    {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MeMeEditorViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MeMeEditorViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    @IBAction func cancelBtn(sender: AnyObject)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func imagePicker(sender: AnyObject)
    {
        imgpicker.sourceType = .PhotoLibrary
        imagePicker()
    }
    
    @IBAction func cameraPicker(sender: AnyObject)
    {
        if(UIImagePickerController.isSourceTypeAvailable(.Camera))
        {
            imgpicker.sourceType = .Camera
            imagePicker()
        }
        else
        {
            showAlert("Error", message: "Device does not support Camera")
        }
    }
    
    @IBAction func actionBtn(sender: AnyObject)
    {
        saveImg()
    }
    
    func showAlert(title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
        
        
    }
    
    func imagePicker()
    {
        clearFields()
        imgpicker.allowsEditing = false
        imgpicker.delegate = self
        presentViewController(imgpicker, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        dismissViewControllerAnimated(true, completion: nil)
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            editorImageView.contentMode = .ScaleAspectFit
            editorImageView.image = img
            textFieldEnable(true)

        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    func keyboardWillShow(sender: NSNotification) {
        if bottomText.editing
        {
          if let userInfo = sender.userInfo
          {
            if let keyboardHeight = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size.height
            {
               view.frame.origin.y = -keyboardHeight
            }
           }
        }
    }
    
    func keyboardWillHide(sender: NSNotification) {
        if bottomText.editing
        {
            view.frame.origin.y = 0
        }
    }
    func textFieldEnable(value: Bool)
    {
        topText.enabled = value
        bottomText.enabled = value
        shareBtn.enabled = value
    }
    func barToolHidden(value: Bool)
    {
        navigationBar.hidden = value
        toolBar.hidden = value
    }
    func clearFields()
    {
        topText.text = ""
        bottomText.text = ""
        editorImageView.image = nil
    }
    func saveImg()
    {
        let img = generateImage()
        let messageStr:String  = "Check out my awesome photo!"
        let shareItems:Array = [img, messageStr]
        let activityViewController:UIActivityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        activityViewController.excludedActivityTypes = [UIActivityTypePrint, UIActivityTypePostToWeibo, UIActivityTypeCopyToPasteboard, UIActivityTypeAddToReadingList, UIActivityTypePostToVimeo]
        presentViewController(activityViewController, animated: true, completion: nil)
        let memeObj = MeMe(_toptext: topText.text!, _bottomtext: bottomText.text!, _image: editorImageView.image!, _memeImage: img)
        (UIApplication.sharedApplication().delegate as! AppDelegate).memes.append(memeObj)
        
         }
    
    func generateImage() -> UIImage
    {
        barToolHidden(true)
        let imageViewSize = editorImageView.bounds
        let width = UIScreen.mainScreen().bounds.size.width
        let height = UIScreen.mainScreen().bounds.size.height
        editorImageView.frame = CGRectMake(0, 0, width, height)
        editorImageView.contentMode = .ScaleAspectFit
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawViewHierarchyInRect(self.view.frame, afterScreenUpdates: true)
        let memedImg: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        editorImageView.bounds = imageViewSize
        barToolHidden(false)
        return memedImg
       
    }
        
}
