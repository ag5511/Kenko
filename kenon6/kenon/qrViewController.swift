//
//  qrViewController.swift
//  kenon
//
//  Created by 後藤敦史 on 2020/12/02.
//

import UIKit
import CoreImage
class qrViewController: UIViewController {

    @IBOutlet weak var qrimage: UIImageView!
    var number: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let data = number.data(using: .utf8) else {
                    return
                }

                let qr = CIFilter(name: "CIQRCodeGenerator", parameters: ["inputMessage": data, "inputCorrectionLevel": "H"])!
                qrimage.image =  UIImage(ciImage: qr.outputImage!)
    }
    @IBAction func idouBtn(_ sender: UIButton) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            // segueのIDを確認して特定のsegueのときのみ動作させる
            if segue.identifier == "touroku" {
                // 2. 遷移先のViewControllerを取得
                let next = segue.destination as? calViewController
                
                
            }
        
        
               
            }
    
}
