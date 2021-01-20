//
//  johoViewController.swift
//  kenon
//
//  Created by 後藤敦史 on 2020/12/17.
//

import UIKit


class johoViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nenBtn: UITextField!
    @IBOutlet weak var classBtn: UITextField!
    @IBOutlet weak var banBtn: UITextField!
    @IBOutlet weak var meiBtn: UITextField!
    var joho = ["0","1","1","岐阜太郎"]
    let userDefaults = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nenBtn.delegate = self
        classBtn.delegate = self
        banBtn.delegate = self
        meiBtn.delegate = self
        
        self.nenBtn.keyboardType = UIKeyboardType.numberPad
        self.classBtn.keyboardType = UIKeyboardType.numberPad
        self.banBtn.keyboardType = UIKeyboardType.numberPad
        
        
        userDefaults.set(joho,forKey:"joho")
        loadUserdefault()
       // let jo:[String] = userDefaults.array(forKey: "joho") as! [String]

            nenBtn.text = joho[0]
            classBtn.text = joho[1]
            banBtn.text = joho[2]
            meiBtn.text = joho[3]
        
        
    }
    
    
    @IBAction func kakuteiBtn(_ sender: UIButton) {
        
        joho[3] = meiBtn.text!
        joho[0] = nenBtn.text!
        joho[1] = classBtn.text!
        joho[2] = banBtn.text!
        
        var text1 = ""
        for i in 0...1{
            text1 = text1 + joho[i]
        }
        
//        userDefaults.set(joho, forKey: "03")

        saveUserDefaults()
        alert(title: "登録",
                      message: "登録が完了しました")
        
        
    }
    func loadUserdefault(){
        joho = userDefaults.array(forKey: "joho") as? [String] ?? []
    }
    func saveUserDefaults() {
        userDefaults.set(joho, forKey: "joho")
        userDefaults.synchronize()
    }
    func changeData(){
        
    }
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
    var alertController: UIAlertController!
    func alert(title:String, message:String) {
            alertController = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK",
                                           style: .default,
                                           handler: nil))
            present(alertController, animated: true)
        }

}
