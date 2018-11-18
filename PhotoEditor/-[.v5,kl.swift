//
//  ViewController.swift
//  Photo Editor
//
//  Created by Hilmy Fauzi on 9/27/17.
//  Copyright © 2017 Fauzee Corp. All rights reserved.
//

import UIKit
//add library
import MobileCoreServices
//akses library
import AssetsLibrary

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imgPreviewPhoto: UIImageView!
    
    override func viewDidLoad() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "cmra@1x.png")
        self.view.insertSubview(backgroundImage, at: 0)
        super.viewDidLoad()
        let color2 = UIColor.white
        let color3 = UIColor.yellow
        
        //deklarasi tabbar
        let tabbar = self.tabBarController?.tabBar
        tabbar?.tintColor = color3
        //bar tint
        tabbar?.barTintColor = UIColor.orange
        //tab bar ga di klik
        tabbar?.unselectedItemTintColor = UIColor.red
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func btnsave(_ sender: Any) {
        //mengecek apakah gambarnya kosong
        if imgPreviewPhoto.image == nil {
            let alert = UIAlertView(title: "Warning", message: "Please Input the Image", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }else{
            //kondisi ketika tidak kosong
            //simpan image
            let imgData = UIImageJPEGRepresentation(imgPreviewPhoto.image!, 1.0)
            //deklarasi kompres image
            let compressJPEG = UIImage(data: imgData!)
            
            //menyimpan gambar ke album photo
            UIImageWriteToSavedPhotosAlbum(compressJPEG!, nil, nil, nil)
            
            //muncul alert ketika berhasil disimpan
            let alert = UIAlertView(title: "Success", message: "Your Image edited has been saved", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
            
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        //deklarasi picker image
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            //memanggil method customFunction
            costumFunction(image : pickedImage)
        }
        //method nya selesai dan akan menghilang secar otomatis
        dismiss(animated: true, completion: nil)
        
    }
    
    //method baru dengan nama method costumFunction
    func costumFunction(image: UIImage){
        imgPreviewPhoto.image = image
    }

    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //method finish dan gambar tidak jadi di pilih
        picker.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnBrowseImage(_ sender: Any) {
        //akses library foto
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            //deklarasi imgPicker sebagai objek dari UIImagePickerController
            let imgPicker = UIImagePickerController()
            //menambahkan delegate pada imgPicker
            imgPicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            //mengature type source nya adalah photolibrary
            imgPicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            //mengatur imgPicker nya biar biasa d edit
            imgPicker.allowsEditing = true
            self.present(imgPicker,animated: true,completion: nil)
        }
    }
    @IBAction func btnBlur(_ sender: Any) {
        //mengecek apakah gambarnya kosong atau tidak
        if imgPreviewPhoto.image == nil {
            let alert = UIAlertView(title: "Warning", message: "Please Input the Image", delegate: nil, cancelButtonTitle: "OK")
            alert.show()        }else{
            //kondisi ketika image nya tidak kosong
            //deklarasi imagePhoto
            let imagePhoto = imgPreviewPhoto.image
            //deklarasi original image
            let originalImage = CIImage(image: imagePhoto!)
            //menambahkan efek image
            let filter = CIFilter(name: "CIBoxBlur")
            filter?.setDefaults()
            filter?.setValue(originalImage, forKey: kCIInputImageKey)
            let outputImage = filter?.outputImage
            let newImage = UIImage(ciImage: outputImage!)
            imgPreviewPhoto.image = newImage
        }
        
        
    }
    @IBAction func btnMono(_ sender: Any) {
        //mengecek apakah gambarnya kosong atau tidak
        if imgPreviewPhoto.image == nil {
            //kondisi ketika kosong
            let alert = UIAlertView(title: "Warning", message: "Please Input the Image", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }else{
            //kondisi ketika image nya tidak kosong
            //deklarasi imagePhoto
            let imagePhoto = imgPreviewPhoto.image
            //deklarasi original image
            let originalImage = CIImage(image: imagePhoto!)
            //menambahkan efek image
            let filter = CIFilter(name: "CIComicEffect")
            filter?.setDefaults()
            filter?.setValue(originalImage, forKey: kCIInputImageKey)
            let outputImage = filter?.outputImage
            let newImage = UIImage(ciImage: outputImage!)
            imgPreviewPhoto.image = newImage
        }
    }
    
    @IBAction func btnEfekSepia(_ sender: Any) {
        //mengecek apakah gambarnya kosong atau tidak
        if imgPreviewPhoto.image == nil {
            //kondisi ketika kosong
            let alert = UIAlertView(title: "Warning", message: "Please Input the Image", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }else{
            //kondisi ketika image nya tidak kosong
            //deklarasi imagePhoto
            let imagePhoto = imgPreviewPhoto.image
            //deklarasi original image
            let originalImage = CIImage(image: imagePhoto!)
            //menambahkan efek image
            let filter = CIFilter(name: "CIHighlightShadowAdjust")
            filter?.setDefaults()
            filter?.setValue(originalImage, forKey: kCIInputImageKey)
            let outputImage = filter?.outputImage
            let newImage = UIImage(ciImage: outputImage!)
            imgPreviewPhoto.image = newImage
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
