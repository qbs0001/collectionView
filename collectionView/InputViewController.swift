//
//  InputViewController.swift
//  collectionView
//
//  Created by 0001 QBS on 2020/06/26.
//  Copyright © 2020 qbs0001. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    // ピッカーを接続する
    @IBOutlet var pickerView: UIPickerView!
    // ピッカーの値
    let dataList = ["赤", "緑", "青"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        // self.pickerView.selectRow(initColor, inComponent: 0, animated: true)
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // 今回は３色
        return dataList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // 配列の色をピッカーに設定
        return dataList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(dataList[row])
        
        // 前画面の取得
        let mainVC = presentingViewController as! ViewController
        
        // ピッカーで選択された色を、セルと色入力画面の背景色に設定
        switch dataList[row] {
        case "赤":
            mainVC.segueCell?.backgroundColor = .red
            view.backgroundColor = .red
        case "緑":
            mainVC.segueCell?.backgroundColor = .green
            view.backgroundColor = .green
        case "青":
            mainVC.segueCell?.backgroundColor = .blue
            view.backgroundColor = .blue
            
        default: break
        }
    }
    
    @IBAction func okBack(_ sender: Any) {
        print("OKボタンが押されました")
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
