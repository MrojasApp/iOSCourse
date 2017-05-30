//
//  AddDogViewController.swift
//  Tarea 03
//
//  Created by Mauricio Rojas Vindas on 29/5/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import UIKit

class AddDogViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    var miControladorImagen: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Dog"
        addSaveDog()
    }

    @IBAction func addImagen(_ sender: UIButton) {
        miControladorImagen =  UIImagePickerController()
        miControladorImagen.delegate = self
        miControladorImagen.sourceType = .photoLibrary
        present(miControladorImagen,animated: true, completion: nil)
    }
    
    func addSaveDog(){
        let saveAction = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNewsAction))
        navigationItem.rightBarButtonItem = saveAction
    }
    
    func saveNewsAction(){
        let randomNum:UInt32 = arc4random_uniform(9)
        let imagen: String = "Perro" + String(randomNum+1)
        
        RealmManager.createDog(name: nameTextField.text!,imageName: imagen, color: colorTextField.text!)
        navigationController?.popViewController(animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("entro")
    }
    
//    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
//        
//        //var guardaImagen: UIImage?
//        
//                miControladorImagen.dismissViewControllerAnimated(true, completion: nil)
//        //        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
//        //        guardaImagen = info[UIImagePickerControllerOriginalImage] as? UIImage
//        //
//        //        UIImageWriteToSavedPhotosAlbum(guardaImagen, nil, nil, nil);
//    }
}
