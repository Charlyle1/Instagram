//
//  CameraViewController.swift
//  Instagrammer2
//
//  Created by Carly Burroughs on 3/8/16.
//  Copyright © 2016 Carly Burroughs. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var caption: String?
    let imagePicker = UIImagePickerController()
    @IBOutlet weak var myPickedImage: UIImageView!
    @IBOutlet weak var captionField: UITextField!
    var originalImage: UIImage!
    var posts: [Post]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        

        // Do any additional setup after loading the view.
    }

    @IBAction func onClickCancel(sender: AnyObject) {
        performSegueWithIdentifier("postSegue", sender: nil)
    }
    
    @IBAction func onClickPickImage(sender: AnyObject) {
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickPost(sender: AnyObject) {
        if let captionText = captionField.text as String? {
            caption = captionText
        }
        Post.postUserImage(myPickedImage.image, withCaption: caption) { (success: Bool, error: NSError?) -> Void in
                if success {
                    //self.navigationController?.popToRootViewControllerAnimated(true)
                    self.performSegueWithIdentifier("postSegue", sender: nil)
                } else {
                    print("could not post")
            }
            }
    }

    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            myPickedImage.image = info[UIImagePickerControllerEditedImage] as? UIImage

            dismissViewControllerAnimated(true, completion: nil)
    }
    
    func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
        resizeImageView.contentMode = UIViewContentMode.ScaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.

    }


}
