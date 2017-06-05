//
//  AddDogViewController.swift
//  Tarea_04
//
//  Created by Mauricio Rojas Vindas on 4/6/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import UIKit

class AddDogViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    
    var imageData = NSData()
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Add Dog"
        addSaveDog()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func AddImageButton(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func addSaveDog(){
        let saveAction = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNewsAction))
        navigationItem.rightBarButtonItem = saveAction
    }
    
    func saveNewsAction(){
        if(validatedFiled()) {
            CoreDataManager.addDog(name: nameTextField.text!, color: colorTextField.text!, imageData: imageData)
            navigationController?.popViewController(animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageData = (UIImagePNGRepresentation(image) as NSData?)!
            navigationItem.rightBarButtonItem?.isEnabled = true
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func validatedFiled() -> Bool {
        if nameTextField.text! .isEmpty {
            displayAlert(pMessage: "Favor ingresar un nombre")
            return false
        }
        if colorTextField.text! .isEmpty {
            displayAlert(pMessage: "Favor ingresar un color")
            return false
        }
        return true
    }
    func displayAlert(pMessage: String?) {
        let alertController = UIAlertController(title: "Error", message: pMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
