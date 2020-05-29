//
//  ViewController.swift
//  FoodTrackFirst1
//
//  Created by admin on 2/29/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    // phần này áp dụng cho việc bấm vào image để lấy các ảnh nguồn.
    @IBAction func seclecImageFromePhotoLibrary () {
        nameTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        // chỉ đc chọn chứ không đc chụp
        imagePickerController.sourceType = .photoLibrary
        // hàm này cũng tương tự như trong viewDidLoad
        imagePickerController.delegate = self
        // hàm đẩy data đi
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // delele picker if user cancal
        dismiss(animated: true, completion: nil)
    }
    
    // tương tác khi ngưới dùng bấm vào ảnh.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] else { return  }
        photoImageView.image = selectedImage as! UIImage
        dismiss(animated: true, completion: nil)
    }
}

