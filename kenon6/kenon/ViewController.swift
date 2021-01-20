//
//  ViewController.swift
//  kenon
//
//  Created by 後藤敦史 on 2020/11/12.
//

import UIKit


class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var ryokochk = 0
    var daruchk = 0
    var sekichk = 0
    var hanachk = 0
    var nodochk = 0
    var nioichk = 0
    var ajichk = 0
    
    
    let date = Date()
    let formatter = DateFormatter()
    @IBOutlet weak var hiduke: UINavigationItem!
    @IBOutlet weak var hidukeLabel: UILabel!
    
    
    @IBOutlet weak var ryokoBtn: UIButton!
    @IBOutlet weak var daruiBtn: UIButton!
    @IBOutlet weak var sekiBtn: UIButton!
    @IBOutlet weak var hanamizuBtn: UIButton!
    @IBOutlet weak var nioiBtn: UIButton!
    @IBOutlet weak var nodoBtn: UIButton!
    @IBOutlet weak var ajiBtn: UIButton!
    
    
   
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBAction func ryokoBtn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected;
        if kenkoData[1] == "0"{
            ryokochk = 1
            kenkoData[1] = "1"
            ryokoBtn.backgroundColor = UIColor.gray
            for j in 2...8{
                kenkoData[j] = "0"
            }
            
            daruiBtn.backgroundColor = UIColor.white
            sekiBtn.backgroundColor = UIColor.white
            hanamizuBtn.backgroundColor = UIColor.white
            nodoBtn.backgroundColor = UIColor.white
            nioiBtn.backgroundColor = UIColor.white
            ajiBtn.backgroundColor = UIColor.white
            
        }else{
            ryokochk = 0
            kenkoData[1] = "0"
            ryokoBtn.backgroundColor = UIColor.white
        }
    }
    @IBAction func daruiBtn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected;
        if kenkoData[2] == "0" && kenkoData[1] == "0"{
            daruchk = 1
            kenkoData[2] = "1"
            daruiBtn.backgroundColor = UIColor.gray
        }else{
            daruchk = 0
            kenkoData[2] = "0"
            daruiBtn.backgroundColor = UIColor.white
        }
    }
    @IBAction func sekiBtn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected;
        if kenkoData[3] == "0" && kenkoData[1] == "0"{
            sekichk = 1
            kenkoData[3] = "1"
            sekiBtn.backgroundColor = UIColor.gray
        }else{
            sekichk = 0
            kenkoData[3] = "0"
            sekiBtn.backgroundColor = UIColor.white
        }
    }
    @IBAction func hanamizuBtn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected;
        if kenkoData[4] == "0" && kenkoData[1] == "0"{
            hanachk = 1
            kenkoData[4] = "1"
            hanamizuBtn.backgroundColor = UIColor.gray
        }else{
            hanachk = 0
            kenkoData[4] = "0"
            hanamizuBtn.backgroundColor = UIColor.white
        }
    }
    @IBAction func nodoBtn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected;
        if kenkoData[5] == "0" && kenkoData[1] == "0"{
            nodochk = 1
            kenkoData[5] = "1"
            nodoBtn.backgroundColor = UIColor.gray
        }else{
            nodochk = 0
            kenkoData[5] = "0"
            nodoBtn.backgroundColor = UIColor.white
        }
    }
    @IBAction func nioiBtn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected;
        if kenkoData[6] == "0" && kenkoData[1] == "0"{
            nioichk = 1
            kenkoData[6] = "1"
            nioiBtn.backgroundColor = UIColor.gray
        }else{
            nioichk = 0
            kenkoData[6] = "0"
            nioiBtn.backgroundColor = UIColor.white
        }
    }
    @IBAction func ajiBtn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected;
        if kenkoData[7] == "0" && kenkoData[1] == "0"{
            ajichk = 1
            kenkoData[7] = "1"
            ajiBtn.backgroundColor = UIColor.gray
        }else{
            ajichk = 0
            kenkoData[7] = "0"
            ajiBtn.backgroundColor = UIColor.white
        }
    }
   
   
    let dataList = [35.0,35.1,35.2,35.3,35.4,35.6,35.7,35.8,35.9,36.0,36.1,36.2,36.3,36.4,36.6,36.7,36.8,36.9,37.0,37.1,37.2,37.3,37.4,37.6,37.7,37.8,37.9,38.0,38.1,38.2,38.3,38.4,38.6,38.7,38.8,38.9,39.0,39.1,39.2,39.3,39.4,39.6,39.7,39.8,39.9,40.0]
    
    let userDefaults = UserDefaults.standard
    var obj:[String]!
    
//        [String]()
    
    
    var kenkoData = ["0","0","0","0","0","0","0","0","0","0","0"]
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Delegate設定
            pickerView.delegate = self
            pickerView.dataSource = self
            
            ryokoBtn.backgroundColor = UIColor.white
            ryokoBtn.layer.cornerRadius = 28.0
            daruiBtn.backgroundColor = UIColor.white
            daruiBtn.layer.cornerRadius = 32.0
            sekiBtn.backgroundColor = UIColor.white
            sekiBtn.layer.cornerRadius = 32.0
            hanamizuBtn.backgroundColor = UIColor.white
            hanamizuBtn.layer.cornerRadius = 32.0
            nodoBtn.backgroundColor = UIColor.white
            nodoBtn.layer.cornerRadius = 32.0
            nioiBtn.backgroundColor = UIColor.white
            nioiBtn.layer.cornerRadius = 32.0
            ajiBtn.backgroundColor = UIColor.white
            ajiBtn.layer.cornerRadius = 28.0
            
            self.view.addSubview(pickerView)
            self.obj = userDefaults.array(forKey:"joho")as? [String] ?? []
//            if (UserDefaults.standard.object(forKey: "03") != nil) {
//                obj = UserDefaults.standard.object(forKey: "03") as? [String] ?? []}
//            else{
//                    obj = ["0","0","0","0"]
//                }
            print(obj)
             kenkoData[9] = getToday(format:"yyyy-MM-dd")
            hiduke.title = "体調チェック"
//            hidukeLabel.text = "おはよう！！" + obj[3] + "さん。" + "¥n" + "今日は" + kenkoData[9] + "です"
            hidukeLabel.text = "今日は" + kenkoData[9] + "です"
        }
    
        
    
    @IBAction func qrBtn(_ sender: UIButton) {
        
    }
    
        // UIPickerViewの列の数
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        // UIPickerViewの行数、リストの数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
                return dataList.count
            }
        
        
        // UIPickerViewの最初の表示
        func pickerView(_ pickerView: UIPickerView,
                        titleForRow row: Int,
                        forComponent component:Int) -> String{
            return String(dataList[row])
        }
        
        // UIPickerViewのRowが選択された時の挙動
     func pickerView(_ pickerView: UIPickerView,
                        didSelectRow row: Int,
                        inComponent component:Int) {
            print(String(dataList[Int(row)]))
        kenkoData[0] = String(dataList[Int(row)])
           
        }
    @IBAction func torokuBtn(_ sender: Any) {
        var kiroku:[[String]]
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            obj = userDefaults.array(forKey:"joho")as? [String] ?? []
            // segueのIDを確認して特定のsegueのときのみ動作させる
            if segue.identifier == "toqrViewController" {
                // 2. 遷移先のViewControllerを取得
                let next = segue.destination as? qrViewController
                // 3. １で用意した遷移先の変数に値を渡す
                
                var csv = kenkoData[9] + "," +  obj[0] + "," +  obj[1] + "," +  obj[2] + "," +  obj[3]
                for i in 0...8{
                  csv = csv + "," + kenkoData[i]
                }


                next?.number = csv
            }
        }
    func getToday(format:String = "yyyy/MM/dd HH:mm:ss") -> String {
            let now = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = format
            return formatter.string(from: now as Date)
        }
    
   
    
        
    
}





