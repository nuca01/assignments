//
//  LoginPageViewController+ImagePicker.swift
//  assignment20
//
//  Created by nuca on 28.04.24.
//

import UIKit
extension LogInPageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            accountImage.image = pickedImage
            saveImageToDocumentsDirectory(image: pickedImage)
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    func saveImageToDocumentsDirectory(image: UIImage) {
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            onDataLoaded?(imageData)
        }
    }

}
