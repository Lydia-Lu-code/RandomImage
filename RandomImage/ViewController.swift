//
//  ViewController.swift
//  RandomImage
//
//  Created by 維衣 on 2020/10/29.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var intText: [UITextField]!
    @IBOutlet weak var blurSwitch: UISwitch!
    @IBOutlet weak var makeButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var storeButton: UIButton!
    @IBOutlet weak var theImageView: UIImageView!

    var lenInt: Int? = 0
    var widInt: Int? = 0
//    var lenSiting: String = ""
//    var widString: String = ""
    
    
    var blurStr: String = ""
//    let fullScreenSize = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        intText[0].delegate = self
        intText[1].delegate = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        intText[0].resignFirstResponder()
        intText[1].resignFirstResponder()
          return true
    }
 
    
    
    func getImage(){

        let urlStr = "https://picsum.photos/\(intText[0].text!)/\(intText[1].text!)/\(blurStr)"
        print("** getImage()- urlStr = \(urlStr)")

        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) {(data, response, error) in
                    if let data = data, let image = UIImage(data: data){
                    print("** data = \(data)")
                    DispatchQueue.main.async {
//                        print("** gat \(self.lenInt)/\(self.widInt) image", image)
                        print("** \(Thread.isMainThread)")
                        self.theImageView.image = image
                    }
                }
            } .resume()
        print("** getImage()- task resume")

        }
    }
       

    @IBAction func lenText(_ sender: UITextField) {
        view.endEditing(true)
    }
    
    @IBAction func widText(_ sender: UITextField) {
        view.endEditing(true)
    }
    
    @IBAction func blurOpen(_ sender: UISwitch) {
        if sender.isOn == true {
            blurStr = "?blur"
        }else{
            blurStr = ""
                }
    }
    
    @IBAction func makeBtn(_ sender: UIButton) {
        getImage()
    }
    
//    @IBSegueAction func showPhoto(_ coder: NSCoder) -> PhotoCollectionViewController? {
//        
//        if let photo = theImageView.image{
//            return PhotoCollectionViewController(coder: coder, photo: photo)
//        }else{
//            return nil
//        }
//    }
}
